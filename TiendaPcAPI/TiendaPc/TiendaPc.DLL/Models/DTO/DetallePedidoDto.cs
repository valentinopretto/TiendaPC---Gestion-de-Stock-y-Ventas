using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaPc.DLL.Models.DTO
{
    public class DetallePedidoDto
    {
        public int Cantidad { get; set; }
        public decimal PreUnitario { get; set;}
        public decimal? Descuento { get; set; }
        public string? NombreComponente { get; set;}
        public string? MarcaComponente { get; set;}
        public string? TipoComponente { get; set;}

    }
}
