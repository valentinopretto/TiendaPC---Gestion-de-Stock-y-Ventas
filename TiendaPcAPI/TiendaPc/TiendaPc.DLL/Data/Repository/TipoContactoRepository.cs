using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Data.Repository
{
    public class TipoContactoRepository : ITipoContactoRepository
    {
        private readonly DB_TIENDA_PCContext _context;

        public TipoContactoRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<List<TipoContacto>> GetAllAsync()
        {
            return await _context.TiposContactos.ToListAsync();
        }
    }
}
