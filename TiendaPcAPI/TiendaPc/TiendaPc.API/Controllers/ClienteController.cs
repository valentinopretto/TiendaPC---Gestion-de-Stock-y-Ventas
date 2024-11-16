using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private readonly IClienteService _clienteService;

        public ClienteController(IClienteService clienteService)
        {
            _clienteService = clienteService;
        }

        [HttpGet("GetClientes")]
        public async Task<IActionResult> GetClientes()
        {
            try
            {
                return Ok(await _clienteService.GetAll());
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno al consultar los clientes");
            }
        }

        [HttpGet("GetAll-ClientesFiltro")]
        public async Task<IActionResult> GetClientesFiltro([FromQuery]string filtro)
        {
            try
            {
                if (filtro == null)
                {
                   return BadRequest(new { message = "Debe proporcionar un filtro" });
                }
                var clientes = await _clienteService.GetAllFiltro(filtro);
                if (clientes.Count == 0)
                    return NotFound(new { message = "No se encontraron clientes que contengan: " + filtro + ", en su Nombre o Apellido"});

                return Ok(clientes);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { message = "Error interno: " + ex.ToString() });

            }
        }

        [HttpGet("GetCliente-ByID")]
        public async Task<IActionResult> GetById([FromQuery]int id)
        {
            try
            {
                return Ok(await _clienteService.GetById(id));
            }
            catch (Exception)
            {
                return NotFound("No se encontró ningun cliente con ese ID");
            }
        }

        [HttpPost("Post-Cliente")]
        public async Task<IActionResult> PostCliente([FromBody] Cliente cliente)
        {
            try
            {
                bool res = await _clienteService.Save(cliente);
                if (cliente == null)
                {
                    return BadRequest("El cliente no puede estar vacío");
                }
                if (!res)
                {
                    return BadRequest("No se pudo grabar el cliente");

                }
                return Ok(res);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error interno al hacer post de cliente, revise los campos");
            }
        }

        [HttpPut("Baja-Cliente")]
        public async Task<IActionResult> BajaCliente(int id)
        {
            try
            {
                bool res = await _clienteService.BajaCliente(id);
                if (id == 0)
                {
                    return BadRequest("Ingrese una id distinta de 0");
                }
                if (!res)
                {
                    return BadRequest("No se encontro ningun cliente con esa id o ya se encuentra dado de baja");
                }
                return Ok(res);
            }
            catch (Exception)
            {
                return StatusCode(500, "Error al dar de baja el cliente");
            }
        }

        [HttpPut("actualizar-cliente")]
        public async Task<IActionResult> updCliente([FromBody] Cliente cliente)
        {
            try
            {
                if(cliente == null)
                {
                    return BadRequest("El cliente viene vacío... Verifique los campos");
                }
                return Ok(await _clienteService.UpdateCliente(cliente));
            }
            catch (Exception)
            {
                return StatusCode(500,"Error interno al modificar este cliente, verifique la existencia de una ID");
            }
        }
    }
}
