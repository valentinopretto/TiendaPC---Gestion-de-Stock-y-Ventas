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
    public class ProvinciaRepository : IProvinciaRepositoy
    {
        private readonly DB_TIENDA_PCContext _context;
        public ProvinciaRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<List<Provincia>> GetAllAsync()
        {
            return await _context.Provincias.ToListAsync();
        }

        //public async Task<List<Provincia>> GetAllByProvinciaAsync(int idProvincia)
        //{
        //    return await _context.Provincias
        //        .Include(p => p.Ciudades).ToListAsync();
        //}
    }
}
