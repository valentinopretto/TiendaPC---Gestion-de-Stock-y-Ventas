using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using WebApplication1.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : ControllerBase
    {
        private readonly IEmpleadoDtoService _empleadoService;

        public EmpleadoController(IEmpleadoDtoService empleadoService)
        {
            _empleadoService = empleadoService;
        }

        [HttpGet("legajoEmp")]
        public async Task<ActionResult<EmpleadoDto>> GetEmpleado(int legajoEmp)
        {
            try
            {
                var empleado = await _empleadoService.GetEmpleadoAsync(legajoEmp);
                if (empleado == null)
                    return NotFound();
                return Ok(empleado);
            }
            catch (Exception ex)
            {
                   return StatusCode(500, ex.Message);

            }
        }
        [HttpPost("validate-legajo-pass")]
        public async Task<IActionResult> ValidateEmpleado([FromQuery] int legajoEmp, [FromQuery] string pass)
        {
            try
            {
                var validEmpleado = await _empleadoService.ValidateCredentialsAsync(legajoEmp, pass);
                if (!validEmpleado )
                {
                    return NotFound("Credenciales no fueron validas");
                }
                return Ok(validEmpleado);
            }
            catch (Exception ex)
            {
                return StatusCode(500,ex.Message);
            }
        }
    }
}
