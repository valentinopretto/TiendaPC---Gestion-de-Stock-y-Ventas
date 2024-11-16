using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BarrioController : ControllerBase
    {
        private readonly IBarrioService _barrioService;
        public BarrioController(IBarrioService barrioService)
        {
            _barrioService = barrioService;
        }
        [HttpGet]
        public async Task<IActionResult> GetBarrioByCiudad(int idCiudad)
        {
            var Barrios = await _barrioService.GetBarriosByCiudadAsync(idCiudad);
            return Ok(Barrios);
        }
            
    }
}
