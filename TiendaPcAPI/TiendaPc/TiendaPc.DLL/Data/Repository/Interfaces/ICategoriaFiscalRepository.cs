using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{
    public interface ICategoriaFiscalRepository
    {
        Task<List<CategoriaFiscal>> GetAllAsync();
    }
}
