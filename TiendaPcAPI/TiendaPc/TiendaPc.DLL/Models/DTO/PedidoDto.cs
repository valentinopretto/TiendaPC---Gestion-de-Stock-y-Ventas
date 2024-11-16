using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Models.DTO
{
    public class PedidoDto
    {
        public int IdPedido { get; set; }
        public string NombreCliente { get; set; }
        public string NombreEmpleado { get; set; }
        public DateTime FechaPedido { get; set; }
        public decimal Total { get; set; }
        public string Estado { get; set; }
        public string NombreFormaPago { get; set; }
    }

}
