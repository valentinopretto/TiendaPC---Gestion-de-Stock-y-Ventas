using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class FormaEntregaService : IFormaEntregaService
    {
        private readonly IFormaEntregaRepository _repository;

        public FormaEntregaService(IFormaEntregaRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<FormaEntrega>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
