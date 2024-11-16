using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class TipoContactoService : ITipoContactoService
    {
        private readonly ITipoContactoRepository _repository;

        public TipoContactoService(ITipoContactoRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<TipoContacto>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
