using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProvinciaController : ControllerBase
    {
        private readonly IProvinciaService _provinciaService;
        public ProvinciaController(IProvinciaService provinciaService)
        {
            _provinciaService = provinciaService;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllProvincias()
        { 
            var provincias = await _provinciaService.GetAllAsync();
            return Ok(provincias);
        }

        //[HttpGet("{idProvincia}")]
        //public async Task<IActionResult> GetProvinciaWithCiudadesAsync(int idProvincia)
        //{
        //    var provincia = await _provinciaService.GetProvinciaWithCiudadesAsync(idProvincia);
        //    if (provincia == null)
        //    {
        //        return NotFound();
        //    }
        //    return Ok(provincia);

        //}
    }
}
