using TiendaPc.DLL.Models;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace TiendaPc.DLL.Services.Interfaces
{
    public interface IFormaEntregaService
    {
        Task<List<FormaEntrega>> GetAllAsync();
    }
}
