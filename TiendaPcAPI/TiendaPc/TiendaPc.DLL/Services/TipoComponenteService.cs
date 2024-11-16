using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class TipoComponenteService : ITipoComponenteService
    {
        private readonly ITipoComponenteRepository _repository;

        public TipoComponenteService(ITipoComponenteRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<TipoComponente>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
