using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class EspecificacionService : IEspecificacionService
    {
        private readonly IEspecificacionRepository _repository;

        public EspecificacionService(IEspecificacionRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<Especificacion>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
