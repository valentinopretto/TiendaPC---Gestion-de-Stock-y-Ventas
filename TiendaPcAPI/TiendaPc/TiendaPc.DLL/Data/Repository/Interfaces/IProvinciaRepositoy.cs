using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository
{
    public interface IProvinciaRepositoy
    {
        Task<List<Provincia>> GetAllAsync();

        //Task<List<Provincia>> GetAllByProvinciaAsync(int idProvincia);
    }
}