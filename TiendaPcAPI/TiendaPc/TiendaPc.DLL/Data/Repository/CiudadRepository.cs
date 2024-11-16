using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository
{
    public class CiudadRepository : ICiudadRepository
    {
        private readonly DB_TIENDA_PCContext _context;
        public CiudadRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }
        public async Task<List<Ciudad>> GetAllAsync()
        {
            return await _context.Ciudades.ToListAsync();
        }

        public async Task<List<Ciudad>> GetAllByProvinciaAsync(int idProvincia)
        {
            return await _context.Ciudades
            .Where(c => c.IdProvincia == idProvincia)
            .Include(c => c.Barrios)  // Incluye los barrios de cada ciudad
            .ToListAsync();
        }
    }
}
