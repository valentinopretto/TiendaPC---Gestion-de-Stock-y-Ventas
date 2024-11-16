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
    public class TipoContactoController : ControllerBase
    {
        private readonly ITipoContactoService _service;

        public TipoContactoController(ITipoContactoService service)
        {
            _service = service;
        }

        [HttpGet("GetAll-TiposContacto")]
        public async Task<IActionResult> GetAllAsync()
        {
            try
            {
                List<TipoContacto> list = await _service.GetAllAsync();
                if (list.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron tipos de contacto" });
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
