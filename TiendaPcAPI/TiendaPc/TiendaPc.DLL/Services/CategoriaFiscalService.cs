using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.DLL.Services
{
    public class CategoriaFiscalService : ICategoriaFiscalService
    {
        private readonly ICategoriaFiscalRepository _repository;
        public CategoriaFiscalService(ICategoriaFiscalRepository repository)
        {
            _repository = repository;
        }
        public async Task<List<CategoriaFiscal>> GetAllAsync()
        {
            return await _repository.GetAllAsync();
        }
    }
}
