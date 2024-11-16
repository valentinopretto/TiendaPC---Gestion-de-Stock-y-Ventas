using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaPc.DLL.DTO
{
    public class DTOVentasComponentes
    {
        public string MarcaComponente { get; set; }  // Marca del componente
        public string NombreComponente { get; set; }  // Nombre del componente
        public int TotalUnidadesVendidas { get; set; }  // Total de unidades vendidas
        public decimal IngresoTotalGenerado { get; set; }  // Ingreso total generado
    }

}
