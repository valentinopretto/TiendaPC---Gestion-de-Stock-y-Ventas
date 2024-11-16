using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository
{
    public class CategoriaFiscalRepository : ICategoriaFiscalRepository
    {
        private readonly DB_TIENDA_PCContext _context;
        public CategoriaFiscalRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }
        public async Task<List<CategoriaFiscal>> GetAllAsync()
        {
           return await _context.CategoriasFiscales.ToListAsync();
        }
    }
}
