using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Services.Interfaces
{
    public interface IComponenteService
    {
        Task<List<Componente>> GetAllAsync();
        Task<List<Componente>> GetAllFiltrosAsync(int? idMarca, int? idTipo, bool? estado);
        Task<Componente> GetByIdAsync(int id);
        Task<bool> UpadateAsycn(Componente componente);
        Task<bool> CreateAsycn(Componente componente);
        Task<bool> LowComponenteAsycn(int id);
    }
}
