// DROP DOWN FORMAS PAGO
async function cargarFormasPago() {
  const response = await fetch('https://localhost:7119/api/FormaPago/GetAll-FormasPago');
  const formasPago = await response.json();

  const menuFormasPago = document.getElementById('formas-pago');
  menuFormasPago.innerHTML = ''; // Limpiar opciones existentes
  const option = document.createElement('a');
  option.className = 'dropdown-item';
  option.href = '#';
  option.textContent = 'TODAS';
  option.setAttribute('data-id', 0); // Guardar el ID en el atributo data-id
  option.addEventListener('click', (event) => {
    event.preventDefault();
    handleOptionClick('formas-pago', option);
  });
  menuFormasPago.appendChild(option)
  formasPago.forEach(fp => {
    const option = document.createElement('a');
    option.className = 'dropdown-item';
    option.href = '#';
    option.textContent = fp.nombreFormaPago;
    option.setAttribute('data-id', fp.idFormaPago); // Guardar el ID en el atributo data-id
    option.addEventListener('click', (event) => {
      event.preventDefault();
      handleOptionClick('formas-pago', option);
    });

    menuFormasPago.appendChild(option);
  });

}

// Llama a la función para cargar las formas de pago al cargar la página
cargarFormasPago();

function handleOptionClick(menuId, selectedItem) {
  // Quita la clase 'active' de todos los elementos en el menú seleccionado
  const items = document.querySelectorAll(`#${menuId} .dropdown-item`);
  items.forEach(item => item.classList.remove('active'));

  // Agrega la clase 'active' al elemento seleccionado
  selectedItem.classList.add('active');

  // Solo ejecuta seleccionarFecha si es el menú de fechas
  if (menuId === 'fecha-options') {
    seleccionarFecha(selectedItem.textContent.trim());
  }
}

// Escuchar clic en opciones de los menús
document.querySelectorAll('.dropdown-menu .dropdown-item').forEach(item => {
  item.addEventListener('click', (event) => {
    event.preventDefault(); // Evita que el enlace recargue la página

    const menuId = event.target.closest('.dropdown-menu').id;
    handleOptionClick(menuId, event.target);
  });
});


// Función para obtener el valor seleccionado o el valor predeterminado
function getSelectedValue(menuId, defaultValue) {
  const selectedItem = document.querySelector(`#${menuId} .dropdown-item.active`);
  return selectedItem
    ? { text: selectedItem.textContent, id: selectedItem.getAttribute('data-id') }
    : { text: defaultValue, id: '' };
}

function seleccionarFecha(fechaSeleccionada) {
  const fechasManual = document.querySelectorAll('.fechas-manual');

  if (fechaSeleccionada === 'INGRESAR FECHAS') {
    // Muestra los inputs de fecha manual
    fechasManual.forEach(el => el.classList.remove('d-none'));
  } else {
    // Oculta los inputs de fecha manual si no es "INGRESAR FECHAS"
    fechasManual.forEach(el => el.classList.add('d-none'));
  }

  // Guardar la selección actual de fecha para usar en el botón de búsqueda
  document.getElementById('buscar-button').setAttribute('data-fecha-seleccionada', fechaSeleccionada);
}

function obtenerFechas(fechaSeleccionada) {
  let fechaDesde, fechaFin;
  const today = new Date();
  today.setHours(23, 59, 59, 999);

  switch (fechaSeleccionada) {
    case 'SEMANA ACTUAL':
      const startOfWeek = new Date(today);
      startOfWeek.setDate(today.getDate() - today.getDay());
      fechaDesde = startOfWeek;
      fechaFin = today;
      break;

    case 'MES ACTUAL':
      const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
      fechaDesde = startOfMonth;
      fechaFin = today;
      break;

    case 'AÑO ACTUAL':
      const startOfYear = new Date(today.getFullYear(), 0, 1);
      fechaDesde = startOfYear;
      fechaFin = today;
      break;

    case 'INGRESAR FECHAS':
      // Obtener las fechas desde los inputs
      const fechaInicioInput = document.getElementById('fechaInicio').value;
      const fechaFinInput = document.getElementById('fechaFin').value;

      if (fechaInicioInput && fechaFinInput) {
        fechaDesde = new Date(fechaInicioInput);
        fechaFin = new Date(fechaFinInput);
        fechaFin.setHours(0, 0, 0, 0);

        // Validación: Verificar que fechaInicio no sea mayor que fechaFin
        if (fechaDesde > fechaFin) {
          swal("Atención!", "La fecha de inicio no puede ser mayor que la fecha de fin.", {
            icon: "warning",
            buttons: {
              confirm: {
                text: "Aceptar",
                className: "btn btn-warning",
              },
            },
          });
          return { fechaDesde: null, fechaFin: null };
        }

        // Validación: Verificar que fechaInicio y fechaFin no sean mayores a la fecha actual
        if (fechaDesde > today || fechaFin > today) {
          swal("Atención!", "Las fechas ingresadas no pueden ser mayores que la fecha actual.", {
            icon: "warning",
            buttons: {
              confirm: {
                text: "Aceptar",
                className: "btn btn-warning",
              },
            },
          });
          return { fechaDesde: null, fechaFin: null };
        }
      } else {
        swal("Atención!", "Por favor ingrese ambas fechas.", {
          icon: "warning",
          buttons: {
            confirm: {
              text: "Aceptar",
              className: "btn btn-warning",
            },
          },
        });
        return { fechaDesde: null, fechaFin: null };
      }
      break;

    default:
      fechaDesde = null;
      fechaFin = null;
  }

  return {
    fechaDesde: fechaDesde ? fechaDesde.toISOString() : null,
    fechaFin: fechaFin ? fechaFin.toISOString() : null
  };
}
document.getElementById('buscar-button').addEventListener('click', () => {
  const fechaSeleccionada = getSelectedValue('fecha-options', 'MES ACTUAL').text;
  const formaPagoSeleccionada = getSelectedValue('formas-pago', 'TODAS');
  const estadoSeleccionado = getSelectedValue('estado-options', 'TODOS').text;

  const { fechaDesde, fechaFin } = obtenerFechas(fechaSeleccionada);
  const idFormaPago = formaPagoSeleccionada.id ? parseInt(formaPagoSeleccionada.id) : null;
  if (fechaDesde && fechaFin) {
    getPedidos(fechaDesde, fechaFin, idFormaPago, estadoSeleccionado);
  }
});

async function getPedidos(fechaDesde, fechaFin, idFormaPago, estado) {
  try {
    let url = `https://localhost:7119/api/Pedido/GetAll-Pedidos-Fitros?`;

    if (fechaDesde) {
      url += `fechaDesde=${fechaDesde}&`;
    }
    if (fechaFin) {
      url += `fechaFin=${fechaFin}&`;
    }
    if (idFormaPago) {
      url += `idFormaPago=${idFormaPago}&`;
    }
    if (estado && estado !== 'TODOS') {
      url += `estado=${estado}`;
    }
    const response = await fetch(url);
    if (response.status === 404) {
      // Mostrar la alerta si el código de respuesta es 404
      swal("!Atención!", "No se encontraron pedidos con los filtros seleccionados.", {
        icon: "warning",
        buttons: {
          confirm: {
            text: "Aceptar",
            className: "btn btn-warning",
          },
        },
      });
      return;
    }
    if (!response.ok) {
      throw new Error("No se pudieron cargar los pedidos");
    }
    const pedidos = await response.json();
    cargarPedidos(pedidos);
  } catch (error) {
    console.error("Error:", error.message);
  }
}
// CARGAR PEDIDOS ///
function cargarPedidos(pedidos) {
  const tablaPedidos = document.getElementById('tabla-pedidos');
  tablaPedidos.innerHTML = '';

  pedidos.forEach((pedido) => {

    let row = '';
    if (pedido.estado == "Pendiente") {
      row = `
        <tr>
          <td hidden>${pedido.idPedido}</td>
          <td>${pedido.nombreCliente}</td>
          <td>${pedido.nombreEmpleado}</td>
          <td>${new Date(pedido.fechaPedido).toLocaleDateString()}</td>
          <td>${pedido.total}</td>
          <td>${pedido.estado}</td>
          <td>${pedido.nombreFormaPago}</td>
          <td>
            <div class="d-flex justify-content-center">
              <button data-id="${pedido.idPedido}" onclick="verDetallePedido(${pedido.idPedido})" id="detallePedido" type="button" class="btn btn-icon btn-round btn-primary me-2" >
                <i class="fas fa-eye"></i>
              </button>
              <button data-id="${pedido.idPedido}" onclick="abrirCancelarPedido(${pedido.idPedido})" id="cancelarPedido" type="button" class="btn btn-icon btn-round btn-danger">
                <i class="icon-close"></i>
              </button>
            </div>
          </td>
        </tr>`;
    }
    else {
      row = `
      <tr>
        <td hidden>${pedido.idPedido}</td>
        <td>${pedido.nombreCliente}</td>
        <td>${pedido.nombreEmpleado}</td>
        <td>${new Date(pedido.fechaPedido).toLocaleDateString()}</td>
        <td>${pedido.total}</td>
        <td>${pedido.estado}</td>
        <td>${pedido.nombreFormaPago}</td>
        <td>
          <div class="d-flex justify-content-center">
            <button data-id="${pedido.idPedido}" onclick="verDetallePedido(${pedido.idPedido})" id="detallePedido" type="button" class="btn btn-icon btn-round btn-primary me-2" >
              <i class="fas fa-eye"></i>
            </button>
          </div>
        </td>
      </tr>`;
    }
    tablaPedidos.insertAdjacentHTML("beforeend", row);
  });
}

function verDetallePedido(id) {
  if(!id)
  {
    swal("Error", "No se pudo cargar el detalle del pedido", "warning");
    return;
  }
  window.location.href = `detallePedido.html?id=${id}`;
}
document.getElementById("cerrarModal").addEventListener("click", cerrarModal);

function cerrarModal() {
  const modalInstance = bootstrap.Modal.getInstance(document.getElementById('modalCancelarPedido'));
  if (modalInstance) modalInstance.hide(); // Asegura eliminar completamente el modal

  // Eliminar cualquier backdrop remanente
  const backdrops = document.querySelectorAll('.modal-backdrop');
  backdrops.forEach(backdrop => backdrop.remove());
}


function abrirCancelarPedido(idComponente) {
  if (idComponente != undefined) {
    document.getElementById("CancelarPedido").reset();
    cargarModalComponente(idComponente);
    const modal = new bootstrap.Modal(document.getElementById('modalCancelarPedido'));
    modal.show();
  }
}

async function cargarModalComponente(id) {
  fetch(`https://localhost:7119/api/Pedido/Get-PedidoDto?id=${id}`)
    .then(response => response.json())
    .then(pedido => {
      document.getElementById("idPedidoHidden").value = pedido.idPedido;
      document.getElementById("idPedido").value = pedido.idPedido;
      document.getElementById("nombreCliente").value = pedido.nombreCliente;
      document.getElementById("fechaPedido").value = new Date(pedido.fechaPedido).toLocaleDateString();
    })
    .catch(error => console.error('Error al cargar los datos del pedido:', error));

}

document.getElementById("Confirmar-Cancelacion").addEventListener("click", function () {

  const idPedido = document.getElementById("idPedidoHidden").value;
  const motivoBaja = document.getElementById("motivoBaja").value;
  if (!motivoBaja) {
    swal("Error", "Debe asignar un motivo para la cancelación.", "warning");
    return;
  }
  if (motivoBaja.length > 100) {
    swal("Error", "El motivo de baja no puede tener más de 100 caracteres.", "warning");
    return;
  }

  swal({
    title: "¿Estás seguro?",
    text: "No podrás revertir esta acción.",
    icon: "warning",
    buttons: {
      cancel: {
        visible: true,
        text: "No, cancelar",
        className: "btn btn-danger",
      },
      confirm: {
        text: "Cancelar Pedido",
        className: "btn btn-success",
      },
    },
  }).then((willDelete) => {
    if (willDelete) {
      cancelarPedido(idPedido, motivoBaja);
    } else {
      swal("Operación cancelada", "El pedido esta a salvo.", {
        buttons: {
          confirm: {
            className: "btn btn-success",
          },
        },
      });
    }
  });
});



async function cancelarPedido(id, motivoBaja) {


  const today = new Date();
  const fechaDesde = new Date(today);
  fechaDesde.setDate(today.getDate() - today.getDay());

  const fechaHasta = new Date(today);
  fechaHasta.setDate(fechaHasta.getDate() + 1);

  // Formatear las fechas en formato 'YYYY-MM-DD'
  const formatoFecha = (fecha) => fecha.toISOString().split('T')[0];
  const fechaDesdeStr = formatoFecha(fechaDesde);
  const fechaHastaStr = formatoFecha(fechaHasta);
  await fetch(`https://localhost:7119/api/Pedido/LowOrder-Pedido?id=${id}&motivoCancelacion=${motivoBaja}`, {
    method: 'PATCH'
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('Error al dar de baja el pedido');
      }
      swal("Éxito", "Pedido cancelado exitosamente.", "success");
      getPedidos(fechaDesdeStr, fechaHastaStr, 0, 'Cancelado');
      cerrarModal();
    })
    .catch(handleError);
}

function handleError(error) {
  console.error(error);
  swal("Error", "Ocurrió un error al realizar la operación.", "error");
}
