using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Data.Repository
{
    public class FormaEntregaRepository : IFormaEntregaRepository
    {
        private readonly DB_TIENDA_PCContext _context;

        public FormaEntregaRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<List<FormaEntrega>> GetAllAsync()
        {
            return await _context.FormasEntregas.ToListAsync();
        }
    }
}
