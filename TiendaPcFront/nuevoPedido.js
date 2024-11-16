async function cargarCombosCliente(){
    try {
        // Cargar opciones de Tipo Entrega
        await cargarSelect('https://localhost:7119/api/Provincia', 'ddlProvincias', 'idProvincia', 'nombreProvincia');
        const ddlProvincias = document.getElementById("ddlProvincias");
        ddlProvincias.selectedIndex = -1;

        // Cargar opciones de Categoría Fiscal
        await cargarSelect('https://localhost:7119/api/TipoDocumento/GetAll-TiposDocumento', 'ddlTipoDocumentos', 'idTipoDoc', 'nombreTipoDocumento');

    } catch (error) {
        console.error('Error al cargar opciones:', error);
    }

}
document.addEventListener("DOMContentLoaded", function() {
    // Event listener para cargar ciudades cuando se selecciona una provincia
    document.getElementById("ddlProvincias").addEventListener("change", function() {
        const idProvincia = this.value;
        if (idProvincia) {
            cargarCiudades(idProvincia);
        } else {
            limpiarSelect("ddlCiudades");
            limpiarSelect("ddlBarrios");
        }
    });

    // Event listener para cargar barrios cuando se selecciona una ciudad
    document.getElementById("ddlCiudades").addEventListener("change", function() {
        const idCiudad = this.value;
        if (idCiudad) {
            cargarBarrios(idCiudad);
        } else {
            limpiarSelect("ddlBarrios");
        }
    });
});


function cargarCiudades(idProvincia) {
    fetch(`https://localhost:7119/api/Ciudad/provincia/${idProvincia}`)
        .then(response => response.json())
        .then(data => {
            const ddlCiudades = document.getElementById("ddlCiudades");
            limpiarSelect("ddlCiudades");
            limpiarSelect("ddlBarrios");
            data.forEach(ciudad => {
                const option = document.createElement("option");
                option.value = ciudad.idCiudad;
                option.textContent = ciudad.nombreCiudad;
                ddlCiudades.appendChild(option);
            });
            ddlCiudades.selectedIndex = -1;
        })
        .catch(error => console.error("Error al cargar ciudades:", error));
}

function cargarBarrios(idCiudad) {
    fetch(`https://localhost:7119/api/Barrio?idCiudad=${idCiudad}`)
        .then(response => response.json())
        .then(data => {
            const ddlBarrios = document.getElementById("ddlBarrios");
            limpiarSelect("ddlBarrios");

            if (data.length === 0) {
                // Muestra una alerta si no hay barrios para la ciudad seleccionada
                swal("Información", "No se encontraron barrios para la ciudad seleccionada.", "info");
                return;
            }

            // Si hay barrios, los agrega al select
            data.forEach(barrio => {
                const option = document.createElement("option");
                option.value = barrio.idBarrio;
                option.textContent = barrio.nombreBarrio;
                ddlBarrios.appendChild(option);
            });
            ddlBarrios.selectedIndex = -1;
        })
        .catch(error => console.error("Error al cargar barrios:", error));
}

function limpiarSelect(selectId) {
    const select = document.getElementById(selectId);
    select.innerHTML = "";  // Limpia las opciones previas
}



document.getElementById("cargarNuevoCliente").addEventListener("click", function () {
    document.getElementById("formularioCliente").reset();
    cargarCombosCliente();
    document.getElementById("guardarCambiosBtn").textContent = "Cargar Cliente";
    const modal = new bootstrap.Modal(document.getElementById('modalNuevoCliente'));
    modal.show();
});

function cerrarModal() {
    const modalInstance = bootstrap.Modal.getInstance(document.getElementById('modalNuevoCliente'));
    if (modalInstance) modalInstance.hide(); // Asegura eliminar completamente el modal

    // Eliminar cualquier backdrop remanente
    const backdrops = document.querySelectorAll('.modal-backdrop');
    backdrops.forEach(backdrop => backdrop.remove());
}
document.getElementById("cerrarModal").addEventListener("click", cerrarModal);

function verificarCampos() {
    const nombre = document.getElementById("nombreCliente").value.trim();
    const apellido = document.getElementById("apellidoCliente").value.trim();
    const direccion = document.getElementById("direccionCliente").value.trim();
    const email = document.getElementById("emailCliente").value.trim();
    const nroCalle = parseInt(document.getElementById("nroCalleCliente").value);

    if (!nombre || !apellido || !direccion || !email || isNaN(nroCalle)) {
        swal("Error", "Todos los campos deben estar completos.", "warning");
        return false;
    }

    if (nombre.length > 50) {
        swal("Error", "El nombre no debe superar los 50 caracteres.", "warning");
        return false;
    }

    if (apellido.length > 50) {
        swal("Error", "El apellido no debe superar los 50 caracteres.", "warning");
        return false;
    }

    if (direccion.length > 100) {
        swal("Error", "La dirección no debe superar los 100 caracteres.", "warning");
        return false;
    }

    if (email.length > 100) {
        swal("Error", "El email no debe superar los 100 caracteres.", "warning");
        return false;
    }

    if (nroCalle <= 0) {
        swal("Error", "El número de calle debe ser mayor a 0.", "warning");
        return false;
    }

    return true;
}

function guardarDatosCliente() {
    if (!verificarCampos()) {
        return;
    }
    const cliente = {
        idBarrio: document.getElementById("ddlBarrios").value,
        idTipoDoc: document.getElementById("ddlTipoDocumentos").value,
        documento: document.getElementById("documentoCliente").value,
        nombre: document.getElementById("nombreCliente").value,
        email : document.getElementById("emailCliente").value,
        apellido: document.getElementById("apellidoCliente").value,
        direccion: document.getElementById("direccionCliente").value,
        nroCalle: parseInt(document.getElementById("nroCalleCliente").value),
        estado: true
    };
    console.log(cliente); 

    fetch(`https://localhost:7119/api/Cliente/Post-Cliente`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(cliente)
    })
        .then(response => handleResponse(response))
        .catch(handleError)
}
document.getElementById("guardarCambiosBtn").addEventListener("click", guardarDatosCliente);


function handleResponse(response) {
    if (!response.ok) {
        throw new Error("Error en la operación");
    }
    swal("Éxito", "Se cargo el cliente con exito", "success")
        .then(() => {
            //obtener id del cliente que acabamos de cargar
            // Recargar la tabla
            cerrarModal();
        });
}


function handleError(error) {
    console.error(error);
    swal("Error", "Ocurrió un error al realizar la operación.", "error");
}

async function buscarClientes() {
    const filtro = document.getElementById('nombreClienteFiltro').value;

    if (filtro.length > 2) {  // Verifica que el filtro tenga al menos 3 caracteres
        try {
            const response = await fetch(`https://localhost:7119/api/Cliente/GetAll-ClientesFiltro?filtro=${encodeURIComponent(filtro)}`, {
                method: 'GET'
            });

            // Verifica el estado de la respuesta
            if (response.ok) {
                const clientes = await response.json();
                const ddlClientes = document.getElementById('ddlClientes');

                // Limpia las opciones previas
                ddlClientes.innerHTML = '';

                // Recorre el array de clientes y crea una opción para cada cliente
                clientes.forEach(cliente => {
                    const option = document.createElement('option');
                    option.value = cliente.idCliente;
                    option.textContent = `${cliente.nombre} ${cliente.apellido}`;  // Muestra nombre y apellido
                    ddlClientes.appendChild(option);
                });
            } else {
                const errorData = await response.json();
                swal("¡Atención!", errorData.message, "warning");
            }
        } catch (error) {
            console.error('Error al buscar clientes:', error);
            swal("Error", "ocurrio un error al buscar los clientes.", "error");
        }
    } else {
        swal("¡Atención!", "Debe ingresar al menos 3 caracteres para buscar clientes.", "info");
    }
}

async function cargarOpciones() {
    try {
        // Cargar opciones de Tipo Entrega
        await cargarSelect('https://localhost:7119/api/FormaEntrega/GetAll-FormasEntrega', 'ddlTipoEntrega', 'idFormaEntrega', 'descripcion');

        // Cargar opciones de Categoría Fiscal
        await cargarSelect('https://localhost:7119/api/CategoriaFiscal/GetAll-CategoriasFiscales', 'ddlCategoriaFiscal', 'idCategoriaFiscal', 'nombreCategoriaFiscal');

        // Cargar opciones de Forma de Pago
        await cargarSelect('https://localhost:7119/api/FormaPago/GetAll-FormasPago', 'ddlFormaPago', 'idFormaPago', 'nombreFormaPago');

    } catch (error) {
        console.error('Error al cargar opciones:', error);
    }
}

// Función para cargar un select con datos de un endpoint específico
async function cargarSelect(endpoint, selectId, valueField, textField) {
    try {
        const response = await fetch(endpoint, {
            method: 'GET'
        });

        if (response.ok) {
            const data = await response.json();
            const selectElement = document.getElementById(selectId);

            // Limpiar opciones anteriores
            selectElement.innerHTML = '';

            // Agregar opciones al select
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = item[valueField];  // Asigna el id
                option.textContent = item[textField];  // Muestra el nombre o descripción
                selectElement.appendChild(option);
            });
        } else {
            const errorData = await response.json();
            console.log(errorData.message);  // Muestra el mensaje de error si la lista está vacía o hay algún problema
        }
    } catch (error) {
        console.error(`Error al cargar el select ${selectId}:`, error);
        swal("Error", "Ocurrio un error al cargar las opciones.", "error");

    }
}

// Llama a la función cargarOpciones cuando la página se haya cargado
document.addEventListener('DOMContentLoaded', cargarOpciones);

//////////////////////////////
document.addEventListener('DOMContentLoaded', () => {
    cargarTiposComponentes();
    cargarMarcas();

    // Agregar eventos de cambio para filtrar y cargar componentes
    document.getElementById('ddlTiposComponentes').addEventListener('change', cargarComponentes);
    document.getElementById('ddlMarcas').addEventListener('change', cargarComponentes);
});

async function cargarTiposComponentes() {
    try {
        const response = await fetch('https://localhost:7119/api/TipoComponente/GetAll-TiposComponente'); // Endpoint de Tipos de Componentes
        if (response.ok) {
            const tipos = await response.json();
            const ddlTiposComponentes = document.getElementById('ddlTiposComponentes');

            // Agregar opción para "Todos"
            const defaultOption = document.createElement('option');
            defaultOption.value = 0;
            defaultOption.textContent = "Todos";
            ddlTiposComponentes.appendChild(defaultOption);

            // Agregar opciones al select
            tipos.forEach(tipo => {
                const option = document.createElement('option');
                option.value = tipo.idTipoComponente;
                option.textContent = tipo.tipo;  // Cambiar a la propiedad correcta
                ddlTiposComponentes.appendChild(option);
            });
            // ddlTiposComponentes.selectedIndex = -1;

        } else {
            console.error('Error al cargar los tipos de componentes.');
        }
    } catch (error) {
        console.error('Error al cargar los tipos de componentes:', error);
    }
}

async function cargarMarcas() {
    try {
        const response = await fetch('https://localhost:7119/api/Marca/GetAll-Marcas'); // Endpoint de Marcas
        if (response.ok) {
            const marcas = await response.json();
            const ddlMarcas = document.getElementById('ddlMarcas');

            // Agregar opción para "Todas"
            const defaultOption = document.createElement('option');
            defaultOption.value = 0;
            defaultOption.textContent = "Todas";
            ddlMarcas.appendChild(defaultOption);

            // Agregar opciones al select
            marcas.forEach(marca => {
                const option = document.createElement('option');
                option.value = marca.idMarca;
                option.textContent = marca.nombreMarca;  // Cambiar a la propiedad correcta
                ddlMarcas.appendChild(option);
            });
            // ddlMarcas.selectedIndex = -1;
        } else {
            console.error('Error al cargar las marcas.');
        }
    } catch (error) {
        console.error('Error al cargar las marcas:', error);
    }
}

async function cargarComponentes() {
    const tipoComponenteId = document.getElementById('ddlTiposComponentes').value || 0;
    const marcaId = document.getElementById('ddlMarcas').value || 0;
    const estado = true; // Siempre enviar true

    try {
        const response = await fetch(`https://localhost:7119/api/Componente/GetAllFiltro-Componentes?estado=${estado}&tipoComponenteId=${tipoComponenteId}&marcaId=${marcaId}`);
        if (response.ok) {
            const componentes = await response.json();
            actualizarDropdownComponentes(componentes);
        } else {
            const errorData = await response.json();
            swal("¡Atención!", errorData.message, "warning");
            limpiarDropdownComponentes(); // Limpia el select si no hay resultados
        }
    } catch (error) {
        console.error('Error al cargar los componentes:', error);
    }
}

function actualizarDropdownComponentes(componentes) {
    const ddlComponentes = document.getElementById('ddlComponentes');
    ddlComponentes.innerHTML = '';

    // Agregar opciones de componentes
    componentes.forEach(componente => {
        const option = document.createElement('option');
        option.value = componente.idComponente;
        option.textContent = componente.nombre;
        ddlComponentes.appendChild(option);
    });
}

function limpiarDropdownComponentes() {
    const ddlComponentes = document.getElementById('ddlComponentes');
    ddlComponentes.innerHTML = ''; // Limpia el contenido del select
}

document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('btnAgregarComponente').addEventListener('click', anadirComponenteATabla);
});

async function anadirComponenteATabla() {
    const componenteId = document.getElementById('ddlComponentes').value;

    if (!componenteId) {
        swal("¡Atención!", "Seleccione un componente para añadir", "info");
        return;
    }

    // Verificar si el componente ya existe en la tabla
    const tablaComponentes = document.getElementById('tablaComponentes');
    const filas = tablaComponentes.getElementsByTagName('tr');
    for (let i = 0; i < filas.length; i++) {
        const idComponenteEnTabla = filas[i].querySelector('td').textContent;
        if (idComponenteEnTabla === componenteId) {
            swal("¡Atención!", "Este componente ya está en la tabla", "warning");
            return;
        }
    }

    // Si el componente no existe en la tabla, se procede a añadirlo
    try {
        const response = await fetch(`https://localhost:7119/api/Componente/GetById-Componente?id=${componenteId}`);
        if (response.ok) {
            const componente = await response.json();
            agregarFilaComponente(componente);
        } else {
            const errorData = await response.json();
            swal("¡Atención!", errorData.message, "warning");
        }
    } catch (error) {
        console.error("Error al obtener el componente:", error);
    }
}

function agregarFilaComponente(componente) {
    const tablaComponentes = document.getElementById('tablaComponentes');
    const fila = document.createElement('tr');

    fila.innerHTML = `
        <td hidden>${componente.idComponente}</td>
        <td>${componente.nombre}</td>
        <td>${componente.idTipoComponenteNavigation.tipo}</td>
        <td>${componente.idMarcaNavigation.nombreMarca}</td>
        <td>$${componente.precio}</td>
        <td>
            <div class="form-group">
                <input type="number" class="form-control" value="1" min="1">
            </div>
        </td>
        <td>
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-icon btn-round btn-danger" onclick="eliminarFila(this)">
                    <i class="icon-close"></i>
                </button>
            </div>
        </td>
    `;
    tablaComponentes.appendChild(fila);
}

function eliminarFila(button) {
    const fila = button.closest('tr');
    fila.remove();
}

function limpiarFormularioPedido() {
    // Eliminar todas las filas de la tabla de componentes
    const tablaComponentes = document.getElementById('tablaComponentes');
    tablaComponentes.innerHTML = ''; // Limpia el contenido de la tabla

    // Limpiar el cliente
    const nombreCliente = document.getElementById('nombreClienteFiltro');
    nombreCliente.value = "";
    const ddlClientes = document.getElementById('ddlClientes');
    ddlClientes.innerHTML = '';

    limpiarDropdownComponentes();

    // Restablecer los dropdowns a sus valores predeterminados
    document.getElementById('ddlTiposComponentes').selectedIndex = 0;
    document.getElementById('ddlMarcas').selectedIndex = 0;
    document.getElementById('ddlFormaPago').selectedIndex = 0;
    document.getElementById('ddlTipoEntrega').selectedIndex = 0;
    document.getElementById('ddlCategoriaFiscal').selectedIndex = 0;

}

// Función para el botón cancelarPedido
document.getElementById('cancelarPedido').addEventListener('click', () => {

    limpiarFormularioPedido();
    swal("¡Atención!", "El pedido fue cancelado.", "info");

});

// Función para el botón cargarPedido
document.getElementById('cargarPedido').addEventListener('click', function (e) {
    e.preventDefault();
    cargarPedido();
});
async function verificarStockComponente(idComponente, cantidad) {
    try {
        const response = await fetch(`https://localhost:7119/api/Componente/GetById-Componente?id=${idComponente}`);
        if (!response.ok) {
            throw new Error("No se encontró el componente o hubo un error en la solicitud.");
        }
        const componente = await response.json();
        console.log(componente.stock);
        
        // Comprobar si la cantidad solicitada supera el stock disponible
        if (cantidad > componente.stock) {
            swal("!Error!", `El componente ${componente.nombre} no tiene suficiente stock. Stock disponible: ${componente.stock}.`, "error");
            return false;
        }
        return true;
    } catch (error) {
        console.error("Error al verificar el stock del componente:", error);
        swal("!Error!", "No se pudo verificar el stock del componente. Intente nuevamente.", "error");
        return false;
    }
}

async function validarPedido() {
    // Verificar si los campos principales están completos
    const idCliente = document.getElementById('ddlClientes').value;
    const idFormaPago = document.getElementById('ddlFormaPago').value;
    const idCategoriaFiscal = document.getElementById('ddlCategoriaFiscal').value;
    const idFormaEntrega = document.getElementById('ddlTipoEntrega').value;
    const legajoEmp = sessionStorage.getItem('legajoEmp'); // Obtener legajo del empleado

    if (!legajoEmp) {
        swal("!Error!", "Debe logearse primero.", "error");
        return false;
    }

    if (!idCliente) {
        swal("!Error!", "Seleccione un cliente.", "error");
        return false;
    }

    if (!idFormaPago) {
        swal("!Error!", "Seleccione una forma de pago.", "error");
        return false;
    }

    if (!idCategoriaFiscal) {
        swal("!Error!", "Seleccione una categoría fiscal.", "error");
        return false;
    }

    if (!idFormaEntrega) {
        swal("!Error!", "Seleccione un tipo de entrega.", "error");
        return false;
    }

    // Verificar si hay al menos un detalle de pedido
    const filasComponentes = document.querySelectorAll('#tablaComponentes tr');
    if (filasComponentes.length === 0) {
        swal("!Error!", "Debe agregar al menos un componente en el pedido.", "error");
        return false;
    }

    // Verificar que cada componente tenga una cantidad válida
    for (const fila of filasComponentes) {
        const idComponente = fila.querySelector('td:nth-child(1)').textContent.trim();
        const cantidad = parseInt(fila.querySelector('input[type="number"]').value, 10);
        
        if (isNaN(cantidad) || cantidad <= 0) {
            swal("!Error!", "Cada componente debe tener una cantidad mayor a 0.", "error");
            return false;
        }

        const stockValido = await verificarStockComponente(idComponente, cantidad);
        if (!stockValido) {
            return false; // Detiene la validación si algún componente no tiene suficiente stock
        }
        // consumir endpoint para que verifique que la cantidad de cada componente no supere el stock que se dispone del mismo

    }

    return true; // Todos los campos son válidos
}


async function cargarPedido() {
    if (!validarPedido()) {
        return; // Detiene el proceso si la validación falla
    }
    const detallesPedidos = [];
    const filasComponentes = document.querySelectorAll('#tablaComponentes tr');

    let idDetallePedido = 1;
    filasComponentes.forEach(fila => {
        const idComponente = fila.querySelector('td:nth-child(1)').textContent.trim(); // Obteniendo texto directo
        const precioUnitario = parseFloat(fila.querySelector('td:nth-child(5)').textContent.replace('$', '').trim());
        const cantidad = parseInt(fila.querySelector('input[type="number"]').value, 10);
        const descuento = 0; // Descuento por defecto

        detallesPedidos.push({
            idDetallePedido: idDetallePedido++,
            idComponente,
            descuento,
            cantidad,
            precioUnitario
        });
    })
    const pedido = {

        idCliente: parseInt(document.getElementById('ddlClientes').value || null),
        idFormaPago: parseInt(document.getElementById('ddlFormaPago').value || null),
        idCategoriaFiscal: parseInt(document.getElementById('ddlCategoriaFiscal').value || null),
        legajoEmp: sessionStorage.getItem('legajoEmp'),
        armadoPc: false,
        idFormaEntrega: parseInt(document.getElementById('ddlTipoEntrega').value || null),
        detallesPedidos: detallesPedidos
    };

    
    try {
        const response = await fetch('https://localhost:7119/api/Pedido/Nuevo-Pedido', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(pedido)
        });

        if (response.ok) {
            const result = await response.json();
            swal("!Exito!", result.message, "success");
            limpiarFormularioPedido();
        } else {
            const errorData = await response.json();
            swal("!Error!", errorData.message, "error");
        }
    } catch (error) {
        console.error("Error en el servidor:", error);
    }
}
