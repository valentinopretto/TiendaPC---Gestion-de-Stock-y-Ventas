using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository
{
    public class EmpleadoDtoRepository : IEmpleadoDto
    {
        private readonly DB_TIENDA_PCContext _context;
        public EmpleadoDtoRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<EmpleadoDto> GetEmpleadoWithDetailsAsync(int legajoEmp)
        {
            var empleado = await _context.Empleados
                
                .Include(e => e.IdRolNavigation)
                .Where(e => e.LegajoEmp == legajoEmp)
                .Select(e => new EmpleadoDto
                {
                    LegajoEmp = e.LegajoEmp,
                    Nombre = e.Nombre,
                    Apellido = e.Apellido,
                    Direccion = e.Direccion,
                    NroCalle = e.NroCalle,
                    Documento = e.Documento,
                   
                    RolNombre = e.IdRolNavigation.Rol,       // Traer nombre del rol
                   
                    Estado = e.Estado
                })
                .FirstOrDefaultAsync();

            return empleado;
        }
        public async Task<bool> ValidateCredentialsAsync(int legajoEmp, string pass)
        {
            // Consulta en la base de datos para verificar si existe el empleado con el legajo y la contraseña proporcionados
            return await _context.Empleados.AnyAsync(e => e.LegajoEmp == legajoEmp && e.Pass == pass);
        }

    }
}
