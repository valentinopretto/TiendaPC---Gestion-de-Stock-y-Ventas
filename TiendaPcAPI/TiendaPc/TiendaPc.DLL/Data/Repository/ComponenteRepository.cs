using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository
{
    public class ComponenteRepository : IComponenteRepository
    {
        private readonly DB_TIENDA_PCContext _context;
        public ComponenteRepository(DB_TIENDA_PCContext context)
        {
            _context  = context;
        }

        public async Task<bool> CreateAsycn(Componente componente)
        {
            _context.Componentes.Add(componente);
            return await _context.SaveChangesAsync() > 0 ? true : false;
        }

        public async Task<List<Componente>> GetAllAsync()
        {
            return await _context.Componentes.Include(tp => tp.IdTipoComponenteNavigation).Include(m => m.IdMarcaNavigation)
                                             .ToListAsync();
        }

        public async Task<List<Componente>> GetAllFiltrosAsync(int? idMarca, int? idTipo, bool? estado)
        {
            // Empezamos con la consulta base de componentes
            var query = _context.Componentes
                      .Include(c => c.IdTipoComponenteNavigation)
                      .Include(c => c.IdMarcaNavigation)
                      .OrderBy(t => t.IdTipoComponenteNavigation.IdTipoComponente)
                      .AsQueryable();

            // Agregar filtros condicionalmente
            if (estado.HasValue)
            {
                query = query.Where(c => c.Estado == estado.Value);
            }

            if (idTipo.HasValue)
            {
                query = query.Where(c => c.IdTipoComponente == idTipo.Value);
            }

            if (idMarca.HasValue)
            {
                query = query.Where(c => c.IdMarca == idMarca.Value);
            }

            return await query.ToListAsync();

        }

        public async Task<Componente> GetByIdAsync(int id)
        {
            return await _context.Componentes.Include(tp => tp.IdTipoComponenteNavigation).Include(m => m.IdMarcaNavigation)
                                            .Where(f => f.IdComponente == id).FirstOrDefaultAsync();
        }

        public async Task<bool> LowComponenteAsycn(int id)
        {
            Componente c = await GetByIdAsync(id);
            if (c != null && c.Estado == true)
            {
                c.Estado = false;
            }
            return await _context.SaveChangesAsync() > 0 ? true : false;
        }

        public async Task<bool> UpadateAsycn(Componente componente)
        {
            _context.Componentes.Update(componente);
            return await _context.SaveChangesAsync() > 0 ? true : false;
        }
    }
}
