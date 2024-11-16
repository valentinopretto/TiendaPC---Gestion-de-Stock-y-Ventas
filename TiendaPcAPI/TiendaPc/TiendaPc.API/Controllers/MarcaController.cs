using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarcaController : ControllerBase
    {
        private readonly IMarcaService _service;

        public MarcaController(IMarcaService service)
        {
            _service = service;
        }

        [HttpGet("GetAll-Marcas")]
        public async Task<IActionResult> GetAllAsync()
        {
            try
            {
                List<Marca> list = await _service.GetAllAsync();
                if (list.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron marcas" });
                }
                return Ok(list);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Error Interno: " + ex.Message });
            }
        }
    }
}
