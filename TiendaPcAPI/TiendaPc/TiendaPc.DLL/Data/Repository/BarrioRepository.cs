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
    public class BarrioRepository : IBarrioRepository
    {
        private readonly DB_TIENDA_PCContext _context;
        public BarrioRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }
        public async Task<List<Barrio>> GetAll()
        {
            return await _context.Barrios.ToListAsync();
        }

        public async Task<List<Barrio>> GetAllByCiudadAsync(int idCiudad)
        {
            return await _context.Barrios
           .Where(b => b.IdCiudad == idCiudad)
           .ToListAsync();
        }
    }
}
