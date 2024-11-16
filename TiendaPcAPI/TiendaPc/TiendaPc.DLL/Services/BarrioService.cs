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
    public class BarrioService : IBarrioService
    {
        private readonly IBarrioRepository _barrioRepository;
        public BarrioService(IBarrioRepository barrioRepository)
        {
            _barrioRepository = barrioRepository;
        }

        public async Task<List<Barrio>> GetAll()
        {
            return await _barrioRepository.GetAll();
        }

        public async Task<List<Barrio>> GetBarriosByCiudadAsync(int idCiudad)
        {
            return await _barrioRepository.GetAllByCiudadAsync(idCiudad);
        }
    }
}
