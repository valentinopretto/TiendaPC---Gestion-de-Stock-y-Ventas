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
    public class FormaEntregaController : ControllerBase
    {
        private readonly IFormaEntregaService _service;

        public FormaEntregaController(IFormaEntregaService service)
        {
            _service = service;
        }

        [HttpGet("GetAll-FormasEntrega")]
        public async Task<IActionResult> GetAllAsync()
        {
            try
            {
                List<FormaEntrega> list = await _service.GetAllAsync();
                if (list.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron formas de entrega" });
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
