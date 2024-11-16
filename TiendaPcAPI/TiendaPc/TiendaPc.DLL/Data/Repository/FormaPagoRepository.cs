using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Data.Repository
{
    public class FormaPagoRepository : IFormaPagoRepository
    {
        private readonly DB_TIENDA_PCContext _context;

        public FormaPagoRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<List<FormaPago>> GetAllAsync()
        {
            return await _context.FormasPagos.ToListAsync();
        }
    }
}
