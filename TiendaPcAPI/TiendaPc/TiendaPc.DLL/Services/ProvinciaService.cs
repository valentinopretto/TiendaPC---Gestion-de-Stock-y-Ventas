using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.DLL.Services
{
    public class ProvinciaService : IProvinciaService 
    {
        private readonly IProvinciaRepositoy _ProvinciaRepositoy;
        public ProvinciaService(IProvinciaRepositoy provinciaRepositoy)
        {
            _ProvinciaRepositoy = provinciaRepositoy;
        }

        public async Task<List<Provincia>> GetAllAsync()
        {
            return await _ProvinciaRepositoy.GetAllAsync();
        }

        //public async Task<List<Provincia>> GetAllByProvinciaAsync(int idProvincia)
        //{
        //    return await _ProvinciaRepositoy.GetAllByProvinciaAsync(idProvincia);
        //}
    }
}
