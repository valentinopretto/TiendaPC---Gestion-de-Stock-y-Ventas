using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Services.Interfaces
{
    public interface ICiudadService
    {
        Task<List<Ciudad>> GetAllAsync();
        Task<List<Ciudad>> GetCiudadesByProvinciaAsync(int idProvincia);
    }
}
