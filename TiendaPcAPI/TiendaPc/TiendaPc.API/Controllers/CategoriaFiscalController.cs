using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriaFiscalController : ControllerBase
    {
        private readonly ICategoriaFiscalService _service;
        public CategoriaFiscalController(ICategoriaFiscalService service)
        {
            _service = service;
        }


        [HttpGet("GetAll-CategoriasFiscales")]
        public async Task<IActionResult> GetAllAsync()
        {
            try
            {
                List<CategoriaFiscal> list = await _service.GetAllAsync();
                if (list.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron categorias fiscales" });
                }
                return Ok(list);
            }
            catch (Exception ex)
            {
                return StatusCode(500,new { message = "Error Interno: " + ex.Message });
            }
        }
    }
}
