using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class TipoDocumentoService : ITipoDocumentoService
    {
        private readonly ITipoDocumentoRepository _repository;

        public TipoDocumentoService(ITipoDocumentoRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<TipoDocumento>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
