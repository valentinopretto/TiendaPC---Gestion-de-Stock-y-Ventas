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
    public class ClienteRepository : IClienteRepository
    {
        private readonly DB_TIENDA_PCContext _context;

        public ClienteRepository(DB_TIENDA_PCContext context)
        {
            _context = context;
        }

        public async Task<bool> BajaCliente(int id)
        {
            var cliente = await _context.Clientes.FindAsync(id);
            if(cliente == null)
            {
                throw new KeyNotFoundException($"No se encontró un cliente con el id {id}");
            }
            else if (cliente.Estado == false)
            {
                throw new Exception("El cliente ya se encuentra dado de baja");
            }
            else
            {
                cliente.Estado = false;
                _context.Clientes.Update(cliente);
            }

            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<List<Cliente>> GetAll()
        {
            return await _context.Clientes.ToListAsync();

        }

        public async Task<List<Cliente>> GetAllFiltro(string filtro)
        {
            var clientes = await _context.Clientes.
                Where(c => c.Nombre.ToLower().Contains(filtro.ToLower()) || c.Apellido.ToLower().Contains(filtro.ToLower())).ToListAsync();
            return clientes;
        }

        public async Task<Cliente> GetById(int id)
        {
            var cliente = await _context.Clientes.FindAsync(id);
            if(cliente == null)
            {
                throw new KeyNotFoundException($"No se encontró un cliente con el id {id}");
            }
            return cliente;
        }

        public async Task<bool> Save(Cliente cliente)
        {
            if(cliente == null)
            {
                throw new ArgumentNullException(nameof(cliente), "El objeto cliente no puede ser nulo.");
            }
            _context.Clientes.Add(cliente);
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<bool> UpdateCliente(Cliente cliente)
        {
            if (cliente == null)
            {
                throw new ArgumentNullException(nameof(cliente), "El objeto cliente no puede ser nulo.");
            }
            _context.Clientes.Update(cliente);
            return await _context.SaveChangesAsync() > 0;
        }
    }
}
