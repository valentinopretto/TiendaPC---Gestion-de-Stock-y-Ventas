using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TipoDocumentoController : ControllerBase
    {
        private readonly ITipoDocumentoService _service;

        public TipoDocumentoController(ITipoDocumentoService service)
        {
            _service = service;
        }

        [HttpGet("GetAll-TiposDocumento")]
        public async Task<IActionResult> GetAllAsync()
        {
            try
            {
                List<TipoDocumento> list = await _service.GetAllAsync();
                if (list.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron tipos de documento" });
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
