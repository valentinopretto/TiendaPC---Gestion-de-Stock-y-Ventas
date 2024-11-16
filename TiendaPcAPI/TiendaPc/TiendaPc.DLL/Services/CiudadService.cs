using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.DLL.Services
{
    public class CiudadService : ICiudadService
    {
        private readonly ICiudadRepository _CiudadRepository;
        public CiudadService(ICiudadRepository cicdRepository)
        {
            _CiudadRepository = cicdRepository;
        }

        public async Task<List<Ciudad>> GetAllAsync()
        {
            return await _CiudadRepository.GetAllAsync();
        }

        public async Task<List<Ciudad>> GetCiudadesByProvinciaAsync(int idProvincia)
        {
            return await _CiudadRepository.GetAllByProvinciaAsync(idProvincia);
        }
    }
}
