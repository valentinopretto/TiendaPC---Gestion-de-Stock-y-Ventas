using TiendaPc.DLL.Data.Repository.Intefaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Data;
using TiendaPc.DLL.Services.Interfaces;
using TiendaPc.DLL.Models.DTO;


namespace TiendaPc.DLL.Services;

public class PedidoService : IPedidoService
{
    private readonly IPedidoRepository _pedidoRepository;

    public PedidoService(IPedidoRepository pedidoRepository)
    {
        _pedidoRepository = pedidoRepository;
    }

    public async Task<List<Pedido>> GetAll()
    {
        return await _pedidoRepository.GetAll();
    }

    public async Task<List<DetallePedidoDto>> GetAllDetallesPedido(int idPedido)
    {
        return await _pedidoRepository.GetAllDetallesPedido(idPedido);
    }

    public async Task<Pedido> GetById(int id)
    {
        return await _pedidoRepository.GetById(id);
    }

    public async Task<PedidoDto> GetByIdPedidoDto(int id)
    {
        return await _pedidoRepository.GetByIdPedidoDto(id);
    }

    public async Task<List<PedidoDto>> GetPedidosFiltros(DateTime? fechaDesde, DateTime? fechaHasta, int? idFormaPago, string? estado) 
    {
        return await _pedidoRepository.GetPedidosFiltros(fechaDesde,fechaHasta,idFormaPago,estado);
    }

    public async Task<List<Pedido>> GetPedidosPCArmadas()
    {
        return await _pedidoRepository.GetPedidosPCArmadas();
    }

    public async Task<bool> LowOrder(int id, string motivoCancelacion)
    {
        return await _pedidoRepository.LowOrder(id,motivoCancelacion);
    }

    public async Task<bool> Save(Pedido pedido)
    {
        return await _pedidoRepository.Save(pedido);
    }

    //public async Task<bool> Update(int id, Pedido pedido)
    //{
    //    return await _pedidoRepository.Update(id, pedido);
    //}
}
