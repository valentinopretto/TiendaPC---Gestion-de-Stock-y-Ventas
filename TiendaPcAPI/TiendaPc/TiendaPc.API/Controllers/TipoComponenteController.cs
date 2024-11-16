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
    public class TipoComponenteController : ControllerBase
    {
        private readonly ITipoComponenteService _service;

        public TipoComponenteController(ITipoComponenteService service)
        {
            _service = service;
        }

        [HttpGet("GetAll-TiposComponente")]
        public async Task<IActionResult> GetAllAsync()
        {
            try
            {
                List<TipoComponente> list = await _service.GetAllAsync();
                if (list.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron tipos de componente" });
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
