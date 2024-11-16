using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Data.Repository.Interfaces;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;

namespace TiendaPc.DLL.Services
{
    public class ClienteService : IClienteService
    {
        private readonly IClienteRepository _clienteRepository;

        public ClienteService(IClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository;
        }

        public async Task<bool> BajaCliente(int id)
        {
            return await _clienteRepository.BajaCliente(id);
        }

        public async Task<List<Cliente>> GetAll()
        {
            return await _clienteRepository.GetAll();
        }

        public async Task<List<Cliente>> GetAllFiltro(string filtro)
        {
            return await _clienteRepository.GetAllFiltro(filtro);
        }

        public async Task<Cliente> GetById(int id)
        {
            return await _clienteRepository.GetById(id);
        }

        public Task<bool> Save(Cliente cliente)
        {
            return _clienteRepository.Save(cliente);
        }

        public async Task<bool> UpdateCliente(Cliente cliente)
        {
            return await _clienteRepository.UpdateCliente(cliente);
        }
    }
}
