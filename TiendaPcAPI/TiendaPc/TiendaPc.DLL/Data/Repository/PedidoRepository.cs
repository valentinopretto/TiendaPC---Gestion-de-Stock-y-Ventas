using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Data;
using TiendaPc.DLL.Data.Repository.Intefaces;
using TiendaPc.DLL.Models.DTO;

namespace TiendaPc.DLL.Data.Repository
{
    public class PedidoRepository : IPedidoRepository
    {
        private readonly DB_TIENDA_PCContext _context;

        public PedidoRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<List<Pedido>> GetAll()
        {
            var lstPedidos = await _context.Pedidos.Include(dp => dp.DetallesPedidos).Include(fp => fp.IdFormaPago).ToListAsync();
            return lstPedidos;
        }

        public async Task<List<DetallePedidoDto>> GetAllDetallesPedido(int idPedido)
        {
            var query = _context.DetallesPedidos
                .Include(dp => dp.IdComponenteNavigation)
                .Where(dp => dp.IdPedido == idPedido)
                .Select(dp => new DetallePedidoDto
                {
                    Cantidad = dp.Cantidad,
                    PreUnitario = dp.PrecioUnitario,
                    Descuento = dp.Descuento,
                    NombreComponente = dp.IdComponenteNavigation.Nombre,
                    MarcaComponente = dp.IdComponenteNavigation.IdMarcaNavigation.NombreMarca,
                    TipoComponente = dp.IdComponenteNavigation.IdTipoComponenteNavigation.Tipo
                }); 
            return await query.ToListAsync();
        }

        public async Task<Pedido> GetById(int id)
        {
            var pedido = await _context.Pedidos.Where(x => x.IdPedido == id).
                Include(dp => dp.DetallesPedidos).FirstOrDefaultAsync();

            return pedido;
        }

        public Task<PedidoDto> GetByIdPedidoDto(int id)
        {
             return _context.Pedidos
               .Include(p => p.IdFormaPagoNavigation)
               .Include(p => p.IdClienteNavigation)
               .Include(p => p.LegajoEmpNavigation)
               .Select(p => new PedidoDto
               {
                   IdPedido = p.IdPedido,
                   NombreCliente = p.IdClienteNavigation.Nombre + ' ' + p.IdClienteNavigation.Apellido,
                   NombreEmpleado = p.LegajoEmpNavigation.Nombre + ' ' + p.LegajoEmpNavigation.Apellido,
                   FechaPedido = p.FechaPedido,
                   Total = p.DetallesPedidos
                           .Sum(detalle => detalle.Cantidad * detalle.PrecioUnitario * (1 - (detalle.Descuento ?? 0) / 100))
                           * (p.IdFormaPagoNavigation.Recargo.HasValue
                               ? (1 + p.IdFormaPagoNavigation.Recargo.Value / 100)
                               : (p.IdFormaPagoNavigation.Descuento.HasValue
                                   ? (1 - p.IdFormaPagoNavigation.Descuento.Value / 100)
                                   : 1)),
                   Estado = p.Estado,
                   NombreFormaPago = p.IdFormaPagoNavigation.NombreFormaPago
               }).FirstOrDefaultAsync(p => p.IdPedido == id);
        }

        public async Task<List<PedidoDto>> GetPedidosFiltros(DateTime? fechaDesde, DateTime? fechaHasta, int? idFormaPago, string? estado)
        {

            var query = _context.Pedidos
                .Include(p => p.IdFormaPagoNavigation)
                .Include(p => p.IdClienteNavigation)
                .Include(p => p.LegajoEmpNavigation)
                .Where(p => (!fechaDesde.HasValue || p.FechaPedido >= fechaDesde)
                            && (!fechaHasta.HasValue || p.FechaPedido <= fechaHasta)
                            && (string.IsNullOrEmpty(estado) || p.Estado == estado)
                            && (!idFormaPago.HasValue || p.IdFormaPago  == idFormaPago.Value))
                .Select(p => new PedidoDto
                {
                    IdPedido = p.IdPedido,
                    NombreCliente = p.IdClienteNavigation.Nombre + ' ' + p.IdClienteNavigation.Apellido, 
                    NombreEmpleado = p.LegajoEmpNavigation.Nombre + ' ' + p.LegajoEmpNavigation.Apellido, 
                    FechaPedido = p.FechaPedido,
                    Total = p.DetallesPedidos
                            .Sum(detalle => detalle.Cantidad * detalle.PrecioUnitario * (1 - (detalle.Descuento ?? 0) / 100))
                            * (p.IdFormaPagoNavigation.Recargo.HasValue
                                ? (1 + p.IdFormaPagoNavigation.Recargo.Value / 100)
                                : (p.IdFormaPagoNavigation.Descuento.HasValue
                                    ? (1 - p.IdFormaPagoNavigation.Descuento.Value / 100)
                                    : 1)),
                    Estado = p.Estado,
                    NombreFormaPago = p.IdFormaPagoNavigation.NombreFormaPago 
                });

            return await query.ToListAsync();
        }

        public async Task<List<Pedido>> GetPedidosPCArmadas()
        {
            var lstBuiltPC = _context.Pedidos.Where(x => x.ArmadoPc == true).Include(dp => dp.DetallesPedidos)
                .ToListAsync();
            return await lstBuiltPC;
        }

        public async Task<bool> LowOrder(int id, string motivoCancelacion)
        {
            var pedido = await _context.Pedidos.FindAsync(id);

            // Verifica si el pedido existe
            if (pedido == null)
            {
                return false; // El pedido no existe
            }
            // Verifica si el pedido no está cancelado o si ya fue entregado
            if (pedido.Estado != "Cancelado" || pedido.Estado != "Entregado")
            {
                pedido.Estado = "Cancelado";
                pedido.FechaCancelacion = DateTime.Now;
                pedido.MotivoCancelacion = motivoCancelacion;

                _context.Pedidos.Update(pedido);
                // Guardar cambios
                return await _context.SaveChangesAsync() > 0;
            }

            return false; // El pedido ya estaba cancelado
        }

        public async Task<bool> Save(Pedido pedido)
        {
            if (!pedido.ArmadoPc)   
            {
                pedido.PrecioArmadoPc = null;
            }
            pedido.FechaPedido = DateTime.Now;
            pedido.Estado = "Pendiente";
            _context.Pedidos.Add(pedido);
            return await _context.SaveChangesAsync() > 0;
        }

        //public async Task<bool> Update(int id, Pedido pedido)
        //{
        //    var findOrderTOupd = await _context.Pedidos
        //       .Include(p => p.DetallesPedidos) // Incluye las relaciones
        //       .Include(p => p.PedidosFormasPagos)
        //       .FirstOrDefaultAsync(p => p.IdPedido == id);

        //    if (findOrderTOupd != null && pedido != null)
        //    {
        //        // Actualización de propiedades individuales
        //        findOrderTOupd.IdCliente = pedido.IdCliente;
        //        findOrderTOupd.IdCategoriaFiscal = pedido.IdCategoriaFiscal;
        //        findOrderTOupd.LegajoEmp = pedido.LegajoEmp;
        //        findOrderTOupd.ArmadoPc = pedido.ArmadoPc;
        //        findOrderTOupd.PrecioArmadoPc = pedido?.PrecioArmadoPc;
        //        findOrderTOupd.FechaPedido = pedido.FechaPedido;
        //        findOrderTOupd.IdFormaEntrega = pedido.IdFormaEntrega;
        //        findOrderTOupd.Cancelado = pedido.Cancelado;
        //        findOrderTOupd.FechaCancelacion = pedido.FechaCancelacion;

        //        // Actualización de DetallesPedidos (sin eliminar los existentes)
        //        findOrderTOupd.DetallesPedidos.Clear();
        //        foreach (var detalle in pedido.DetallesPedidos)
        //        {
        //            findOrderTOupd.DetallesPedidos.Add(detalle);
        //        }

        //        // Actualización de PedidosFormasPagos
        //        findOrderTOupd.PedidosFormasPagos.Clear();
        //        foreach (var formaPago in pedido.PedidosFormasPagos)
        //        {
        //            findOrderTOupd.PedidosFormasPagos.Add(formaPago);
        //        }

        //        /*Guardamos los cambioss (No necesita usar update ya que recuperamos el pedido con FIND,
        //        * solo con usar SaveChangesAsync() ya se hace correctamente.
        //        */
        //        return await _context.SaveChangesAsync() > 0;

        //    }
        //    else
        //        return false;  //retorna false si no encuentra el pedido.
        //}

    }
}
