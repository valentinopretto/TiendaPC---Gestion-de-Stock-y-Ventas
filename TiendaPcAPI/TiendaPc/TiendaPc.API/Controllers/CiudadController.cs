using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CiudadController : ControllerBase
    {
        private readonly ICiudadService _CiudadService;
        public CiudadController(ICiudadService ciudadService)
        {
            _CiudadService = ciudadService;

        }

        [HttpGet("provincia/{idprovincia}")]
        public async Task<IActionResult> GetCiudadesByProvincia(int idprovincia)
        {
            var ciudades = await _CiudadService.GetCiudadesByProvinciaAsync(idprovincia);
            return Ok(ciudades);
        }

    }
}
