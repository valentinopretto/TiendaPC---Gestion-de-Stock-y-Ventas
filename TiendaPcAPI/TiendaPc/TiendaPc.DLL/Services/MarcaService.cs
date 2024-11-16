using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class MarcaService : IMarcaService
    {
        private readonly IMarcaRepository _repository;

        public MarcaService(IMarcaRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<Marca>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
