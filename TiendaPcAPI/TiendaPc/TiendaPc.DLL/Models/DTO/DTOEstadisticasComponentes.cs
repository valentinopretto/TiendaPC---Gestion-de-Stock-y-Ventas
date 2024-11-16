using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaPc.DLL.DTO
{
    public class DTOEstadisticasTipoComponente
    {
        public string TipoComponente { get; set; }
        public int VentasDelTipo { get; set; }
        public decimal ImporteTotal { get; set; }
        public decimal PromedioVenta { get; set; }
    }
}
