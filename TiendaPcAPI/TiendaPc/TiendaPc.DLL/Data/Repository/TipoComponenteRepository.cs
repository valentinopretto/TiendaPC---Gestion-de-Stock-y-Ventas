using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Data.Repository
{
    public class TipoComponenteRepository : ITipoComponenteRepository
    {
        private readonly DB_TIENDA_PCContext _context;

        public TipoComponenteRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<List<TipoComponente>> GetAllAsync()
        {
            return await _context.TiposComponentes.ToListAsync();
        }
    }
}
