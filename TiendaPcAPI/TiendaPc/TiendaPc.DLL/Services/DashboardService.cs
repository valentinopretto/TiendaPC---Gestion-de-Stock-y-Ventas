using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.API.DTO;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.DTO;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.DLL.Services
{
    public class DashboardService : IDashboardService
    {
        private readonly IDashboardRepository _dashboardRepository;

        public DashboardService(IDashboardRepository dashboardRepository)
        {
            _dashboardRepository = dashboardRepository;
        }

        public Task<List<DTOVentasMarcas>> GetEstadisticasMarcas()
        {
            return _dashboardRepository.GetEstadisticasMarcas();
        }

        public Task<List<DTOEstadisticasTipoComponente>> GetDTOEstadisticasTipoComponentes()
        {
            return _dashboardRepository.GetDTOEstadisticasTipoComponentes();
        }

        public Task<List<DTOVentasComponentes>> GetVentasComponentes()
        {
            return _dashboardRepository.GetVentasComponentes();
        }

        public Task<List<DTOFacturacionPorMes>> GetFacturacionPorMes(int? year = null)
        {
            return _dashboardRepository.GetFacturacionPorMes(year);
        }

        public Task<int> GetNumeroVentasMesActual()
        {
            return _dashboardRepository.GetNumeroVentasMesActual();
        }

        public Task<decimal> FacturacionDeEsteMes()
        {
            return _dashboardRepository.FacturacionDeEsteMes();
        }

        public Task<int> GetCantidadClientes()
        {
            return _dashboardRepository.GetCantidadClientes();
        }
    }
}
