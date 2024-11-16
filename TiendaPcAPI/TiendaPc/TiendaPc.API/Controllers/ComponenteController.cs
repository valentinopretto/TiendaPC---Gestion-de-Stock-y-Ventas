using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.ComponentModel;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComponenteController : ControllerBase
    {
        private readonly IComponenteService _service;
        public ComponenteController(IComponenteService service)
        {
            _service = service;
        }

        [HttpGet("GetAll-Componentes")]
        public async Task<IActionResult> GetAllAsync() 
        {
            try
            {
                // trae todos los componentes activos.
                List<Componente> componentes = await _service.GetAllAsync();
                if (componentes.Count == 0)
                    return NotFound(new { message = "No se encontraron componentes"});

                return Ok(componentes);
            }
            catch (Exception ex)
            {
                return StatusCode(500,"error interno: " + ex.ToString());
            }

        }
        [HttpGet("GetAllFiltro-Componentes")]
        public async Task<IActionResult> FiltrarComponentes([FromQuery] bool? estado, [FromQuery] int? tipoComponenteId, [FromQuery] int? marcaId)
        {
            try
            {
                if (tipoComponenteId == 0)
                {
                    tipoComponenteId = null;
                }
                if (marcaId == 0)
                {
                    marcaId = null;
                }
                List<Componente> componentes = await _service.GetAllFiltrosAsync(marcaId,tipoComponenteId,estado);
                if (componentes.Count == 0)
                {
                    return NotFound(new { message = "No se encontraron componentes"});
                }
                return Ok(componentes);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Error interno: " + ex.ToString() });
            }
        }

        [HttpGet("GetById-Componente")]
        public async Task<IActionResult> GetByIdAsync([FromQuery] int id)
        {
            try
            {
                Componente componente = await _service.GetByIdAsync(id);
                if (componente == null)
                    return NotFound(new { message = "No se encontro un componente con esa id o no existe." });

                return Ok(componente);
            }
            catch (SqlException ex)
            {
                return StatusCode(500, new { message = "Error interno: " + ex.ToString() });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Error interno: " + ex.ToString() });

            }
        }

        [HttpPost("Create-Componente")]
        public async Task<IActionResult> CreateAsync([FromBody] Componente componente)
        {
            try
            {
                bool res = await _service.CreateAsycn(componente);
                if (!res)
                    return BadRequest(new { message = "No se pudo crear el componente" });

                return Ok(res);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "error interno: " + ex.ToString());
            }
        }

        [HttpPut("Update-Componente")]
        public async Task<IActionResult> UpdateAsync([FromBody] Componente componente)
        {
            try
            {
                bool res = await _service.UpadateAsycn(componente);
                if (!res)
                    return BadRequest(new { message = "No se pudo modificar el componente" });

                return Ok(res);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "error interno: " + ex.ToString());
            }
        }

        [HttpPut("Low-Componente")]
        public async Task<IActionResult> LowComponenteAsync(int id)
        {
            try
            {
                bool res = await _service.LowComponenteAsycn(id);
                if (!res)
                    return BadRequest(new { message = "No se pudo dar de baja el componente"});

                return Ok(res);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "error interno: " + ex.ToString());
            }
        }

    }
}
