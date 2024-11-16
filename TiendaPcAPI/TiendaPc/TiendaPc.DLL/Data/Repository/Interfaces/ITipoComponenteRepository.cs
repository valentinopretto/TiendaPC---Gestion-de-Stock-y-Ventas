using TiendaPc.DLL.Models;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{
    public interface ITipoComponenteRepository
    {
        Task<List<TipoComponente>> GetAllAsync();
    }
}
