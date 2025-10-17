
//funcion para cargar tarjetita de pedidos
document.addEventListener('DOMContentLoaded', async function getNroVentasMesActual() {
  const pedidosMesActual = document.getElementById('nroPedidos-card');
  
  try {
    const response = await fetch('https://localhost:7119/api/Dashboard/GetNroVentasMesActual');
    if (!response.ok) {
      throw new Error('Error en la respuesta del servidor');
    }
    
    const data = await response.json();
    pedidosMesActual.textContent = data;
  } catch (error) {
    console.error('Error al obtener los datos:', error);
    pedidosMesActual.textContent = 'Error al cargar los datos';
  }
});
//tarjetita de totalventas
document.addEventListener('DOMContentLoaded', async function (){
  const ventasMes = document.getElementById('ventasMes');
  try {
    const response = await fetch('https://localhost:7119/api/Dashboard/GetFacturacionDeEsteMes');
    if(!response.ok){
      throw new Error('Error en la respuesta del servidor');
    }
    const data = await response.json();
    ventasMes.textContent = data;
  }
  catch(error){
    console.log('Error al obtener los datos', error);
    
  }
})

//tarjetita clientes
document.addEventListener('DOMContentLoaded', async function loadCantClientes(){
  const cantClientes = document.getElementById('cantClientes');
  try{
    const response = await fetch('https://localhost:7119/api/Dashboard/GetCantClientes');
    if(!response.ok){
      throw new Error('Error en la respuesta del servidor');
    }
    const data = await response.json();
    cantClientes.textContent = data;
  }
  catch(error){
    console.log('Error al obtener los datos', error);
    ventasMes.textContent = "Error";
  }
})


// Obtener el elemento del select y el título de la tabla
const select = document.getElementById('endpointSelect');
const tableTitle = document.getElementById('tableTitle');
const colMarca = document.getElementById('colMarca');
const colTotalVentas = document.getElementById('colTotalVentas');
const colImporteTotal = document.getElementById('colImporteTotal');
const colPromedioVenta = document.getElementById('colPromedioVenta');

async function cargarEstadisticas() {
    const endpoint = select.value;
    const url = `https://localhost:7119/api/Dashboard/${endpoint}`;

    //segun lo que traiga el endpoint modificar la estructura
    switch(endpoint){
        case 'GetEstadisticasMarcas':
            tableTitle.textContent = "Marcas mas Compradas";
            colMarca.textContent = "Marca";
            colTotalVentas.textContent = "Total Ventas";
            colImporteTotal.textContent = "Importe Total";
            colPromedioVenta.textContent = "Promedio Venta";
            break;

        case 'GetInformeTipoComponentes':
            tableTitle.textContent = "Tipos de Componentes Mas Comprados";
            colMarca.textContent = "Tipo de Componente";
            colTotalVentas.textContent = "Cantidad de Ventas";
            colImporteTotal.textContent = "Importe Total";
            colPromedioVenta.textContent = "Promedio de Venta";
            break;

        case 'GetVentasComponentes':
            tableTitle.textContent = "Ventas de Componentes";
            colMarca.textContent = "Componente";
            colTotalVentas.textContent = "Marca";
            colImporteTotal.textContent = "Unidades Vendidas";
            colPromedioVenta.textContent = "Total Facturado";
            break;

        default:
            tableTitle.textContent = "Estadísticas de Ventas";
            break;
    }

    // hacer la petición
    await fetch(url ,{
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if(!response.ok){
            throw new Error('Error en la red: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        const tbody = document.querySelector('#tabla-estadisticas tbody');
        tbody.innerHTML = ""; // vacía la tabla

        if(data.length === 0){
            const tr = document.createElement('tr');
            const td = document.createElement('td');
            td.colSpan = 4;
            td.textContent = 'No se encontraron resultados';
            tr.appendChild(td);
            tbody.appendChild(tr);
            return;
        }

        data.forEach(item => {
            const tr = document.createElement('tr');

            // Ajustar el mapeo de datos según el endpoint
            if (endpoint === 'GetEstadisticasMarcas') {
                tr.innerHTML = `
                    <td>${item.marcas}</td>
                    <td>${item.totalVentas}</td>
                    <td>${item.importeTotal.toFixed(2)}</td>
                    <td>${item.promedioVenta.toFixed(2)}</td>
                `;
            } else if (endpoint === 'GetInformeTipoComponentes') {
                tr.innerHTML = `
                    <td>${item.tipoComponente}</td>
                    <td>${item.ventasDelTipo}</td>
                    <td>${item.importeTotal}</td>
                    <td>${item.promedioVenta}</td>
                `;
            } else if (endpoint === 'GetVentasComponentes') {
                tr.innerHTML = `
                    <td>${item.nombreComponente}</td>
                    <td>${item.marcaComponente}</td>
                    <td>${item.totalUnidadesVendidas}</td>
                    <td>${item.ingresoTotalGenerado}</td>
                    
                `;
            }

            tbody.appendChild(tr);
        });
    })
    .catch(error => {
        console.error(error);
        // Mostrar mensaje de error si ocurre alguna excepción
        const tbody = document.querySelector('#tabla-estadisticas tbody');
        tbody.innerHTML = "<tr><td colspan='4'>Error al cargar los datos</td></tr>";
    });
}

// Llamar a la función para cargar los datos iniciales
cargarEstadisticas();

// Escuchar cambios en el select para recargar la tabla
select.addEventListener('change', cargarEstadisticas);


document.addEventListener("DOMContentLoaded", function () {
    const yearSelect = document.getElementById("yearSelect");

    // Definir el primer año y el año actual
    const startYear = 2018;
    const currentYear = new Date().getFullYear();
  
    // Crear opciones para cada año desde startYear hasta el año actual
    for (let year = startYear; year <= currentYear; year++) {
      const option = document.createElement("option");
      option.value = year;
      option.textContent = year;
      yearSelect.appendChild(option);
    }
});

document.addEventListener("DOMContentLoaded", function () {
  // Obtén el canvas donde se renderizará el gráfico
  const ctx = document.getElementById('facturacionChart').getContext('2d');

  // Cargar el gráfico inicialmente sin ningún filtro de año
  loadChart();

  // Función para cargar los datos y renderizar el gráfico
  function loadChart(year = '') {
      // Construir la URL con el año si está seleccionado
      let url = 'https://localhost:7119/api/Dashboard/GetFacturacionPorMes';
      if (year) {
          url += `?year=${year}`;
      }

      // Hacer la solicitud fetch al backend para obtener los datos
      fetch(url)
          .then(response => response.json())
          .then(data => {
              const meses = data.map(item => getMonthName(item.mes)); // Obtener el nombre del mes
              const facturacion = data.map(item => item.facturacion); // Extraer la facturación

              // Configuración del gráfico
              const chart = new Chart(ctx, {
                  type: 'bar', // Tipo de gráfico: barras
                  data: {
                      labels: meses, // Meses como etiquetas
                      datasets: [{
                          label: 'Facturación por Mes',
                          data: facturacion, // Datos de facturación
                          backgroundColor: 'rgba(54, 162, 235, 0.6)', // Color de las barras
                          borderColor: 'rgba(54, 162, 235, 1)', // Color del borde
                          borderWidth: 1
                      }]
                  },
                  options: {
                      responsive: true, // Hace que el gráfico sea responsive
                      maintainAspectRatio: false, // Permite que el tamaño cambie según el contenedor
                      scales: {
                          y: {
                              beginAtZero: true, // Empieza desde 0 en el eje Y
                              ticks: {
                                  stepSize: 100000 // Ajusta el paso de las unidades en el eje Y
                              }
                          }
                      },
                      plugins: {
                          legend: {
                              display: false // Oculta la leyenda si no es necesaria
                          }
                      }
                  }
              });
          })
          .catch(error => {
              console.error('Error al cargar los datos para el gráfico:', error);
          });
  }

  // Función para obtener el nombre del mes a partir de su número
  function getMonthName(monthNumber) {
      const months = [
          'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
          'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
      ];
      return months[monthNumber - 1];
  }

  // Event listener para el select de año
  document.getElementById('yearSelect').addEventListener('change', function (e) {
      const selectedYear = e.target.value; // Obtén el año seleccionado
      loadChart(selectedYear); // Cargar el gráfico con el filtro por año
  });
});
