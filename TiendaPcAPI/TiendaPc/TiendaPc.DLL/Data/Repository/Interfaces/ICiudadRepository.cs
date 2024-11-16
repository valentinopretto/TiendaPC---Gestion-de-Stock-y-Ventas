using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{
    public interface ICiudadRepository
    {
        Task<List<Ciudad>> GetAllAsync();
        Task<List<Ciudad>> GetAllByProvinciaAsync(int idProvincia);

    }
}
