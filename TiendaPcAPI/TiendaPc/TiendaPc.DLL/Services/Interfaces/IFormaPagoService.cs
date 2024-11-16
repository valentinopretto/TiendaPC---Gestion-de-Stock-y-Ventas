using TiendaPc.DLL.Models;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace TiendaPc.DLL.Services.Interfaces
{
    public interface IFormaPagoService
    {
        Task<List<FormaPago>> GetAllAsync();
    }
}
