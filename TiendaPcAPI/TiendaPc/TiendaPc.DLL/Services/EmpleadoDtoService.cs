using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using WebApplication1.Services.Interfaces;

namespace WebApplication1.Services
{
    public class EmpleadoDtoService : IEmpleadoDtoService
    {
        private readonly IEmpleadoDto _empleado;
        public EmpleadoDtoService(IEmpleadoDto empleadoDto)
        {
            _empleado = empleadoDto;
        }
        public async Task<EmpleadoDto> GetEmpleadoAsync(int legajoEmp)
        {
            return await _empleado.GetEmpleadoWithDetailsAsync(legajoEmp);
        }

        public async Task<bool> ValidateCredentialsAsync(int legajoEmp, string pass)
        {
            return await _empleado.ValidateCredentialsAsync(legajoEmp, pass);
        }
    }
}
