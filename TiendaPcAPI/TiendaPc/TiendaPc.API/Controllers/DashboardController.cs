using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.CompilerServices;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly IDashboardService _dasboardService;

        public DashboardController(IDashboardService service)
        {
            _dasboardService = service;
        }

        [HttpGet("GetEstadisticasMarcas")]
        public async Task<IActionResult> GetEstadisticasMarcas()
        {
            try
            {
                return Ok(await _dasboardService.GetEstadisticasMarcas());
            }
            catch (Exception)
            {
                return NotFound("No se encontraron resultados de la consulta");
            }
        }

        [HttpGet("GetInformeTipoComponentes")]
        public async Task<IActionResult> GetInformeComponentes()
        {
            try
            {
                var resultado = await _dasboardService.GetDTOEstadisticasTipoComponentes();
                return Ok(resultado);
            }
            catch (Exception ex)
            {
                // Registrar el error
                return StatusCode(500, "Ocurrió un error en el servidor: " + ex.Message);
            }
        }

        [HttpGet("GetVentasComponentes")]
        public async Task<IActionResult> GetVentasComponentes()
        {
            try
            {
                return Ok(await _dasboardService.GetVentasComponentes());
            }
            catch (Exception)
            {
                return NotFound("No se encontraron resultados de ventas de estos componentes");
            }
        }

        [HttpGet("GetFacturacionPorMes")]
        public async Task<IActionResult> GetFacturacionPorMes(int? year = null)
        {
            try
            {
                return Ok(await _dasboardService.GetFacturacionPorMes(year));
            }
            catch (Exception)
            {
                return NotFound("No se encontraron facturaciones");
            }
        }

        [HttpGet("GetNroVentasMesActual")]
        public async Task<IActionResult> GetNroVentasMesActual()
        {
            try
            {
                return Ok(await _dasboardService.GetNumeroVentasMesActual());
            }
            catch (Exception)
            {
                return NotFound("No hay ventas el corriente mes");
            }
        }

        [HttpGet("GetFacturacionDeEsteMes")]
        public async Task<IActionResult> GetFactMesActual()
        {
            try
            {
                return Ok(await _dasboardService.FacturacionDeEsteMes());
            }
            catch (Exception)
            {
                return NotFound();
            }
        }

        [HttpGet("GetCantClientes")]
        public async Task<IActionResult> GetCantClientes()
        {
            try
            {
                return Ok(await _dasboardService.GetCantidadClientes());
            }
            catch (Exception)
            {
                return NotFound();
            }
        }
    }   
}
