using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{
    public interface IEmpleadoDto
    {
        Task<bool> ValidateCredentialsAsync(int legajoEmp, string pass);
        Task<EmpleadoDto> GetEmpleadoWithDetailsAsync(int legajoEmp);
    }
}
