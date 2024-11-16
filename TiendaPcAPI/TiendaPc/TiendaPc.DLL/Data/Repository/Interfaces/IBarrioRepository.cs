using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{
    public interface IBarrioRepository
    {
        Task<List<Barrio>> GetAll();
        Task<List<Barrio>> GetAllByCiudadAsync(int idCiudad);
    }
}
