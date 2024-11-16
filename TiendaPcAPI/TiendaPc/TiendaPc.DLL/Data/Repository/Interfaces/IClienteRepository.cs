using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TiendaPc.DLL.Models;

namespace TiendaPc.DLL.Data.Repository.Interfaces
{
    public interface IClienteRepository
    {
        Task<List<Cliente>> GetAll();
        Task<List<Cliente>> GetAllFiltro(string filtro);
        Task<Cliente> GetById(int id);
        Task<bool> Save(Cliente cliente);
        Task<bool> BajaCliente(int id);
        Task<bool> UpdateCliente(Cliente cliente);
    }
}
