using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.API.DTO;
using TiendaPc.DLL.DTO;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{ 
    public interface IDashboardRepository
    {
        Task<List<DTOVentasMarcas>> GetEstadisticasMarcas();
        Task<List<DTOEstadisticasTipoComponente>> GetDTOEstadisticasTipoComponentes();
        Task<List<DTOVentasComponentes>> GetVentasComponentes();
        Task<List<DTOFacturacionPorMes>> GetFacturacionPorMes(int? year = null);
        Task<int> GetNumeroVentasMesActual();
        Task<decimal> FacturacionDeEsteMes();
        Task<int> GetCantidadClientes();
    }
}