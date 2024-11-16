using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Models;

namespace WebApplication1.Services.Interfaces
{
    public interface IEmpleadoDtoService
    {
        Task<EmpleadoDto> GetEmpleadoAsync(int legajoEmp);
        Task<bool> ValidateCredentialsAsync(int legajoEmp, string pass);
    }
}
