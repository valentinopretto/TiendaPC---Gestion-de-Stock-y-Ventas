using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Services
{
    public class FormaPagoService : IFormaPagoService
    {
        private readonly IFormaPagoRepository _repository;

        public FormaPagoService(IFormaPagoRepository repository)
        {
            _repository = repository;
        }

        public async Task<List<FormaPago>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
