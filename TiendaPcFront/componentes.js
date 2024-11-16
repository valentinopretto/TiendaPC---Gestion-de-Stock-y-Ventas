async function cargarComponentes(url, modo) {
    try {
        const response = await fetch(url);
        if (response.status === 404) {
            // Mostrar la alerta si el código de respuesta es 404
            swal("!Atención!", "No se encontraron componentes con los filtros seleccionados.", {
                icon: "warning",
                buttons: {
                    confirm: {
                        text: "Aceptar",
                        className: "btn btn-warning",
                    },
                },
            });
            return; // Salir de la función si no hay componentes
        }
        if (!response.ok) {
            throw new Error('Error en la red: ' + response.status);
        }

        const data = await response.json();


        const tbody = document.querySelector(".table tbody");
        tbody.innerHTML = ""; // Limpia la tabla antes de agregar nuevos datos


        const count = [].concat.apply([], data).length
        if (count > 1 || modo == "muchos") {
            data.forEach(componente => {
                const estado = componente.estado ? "Activo" : "Inactivo";
                const marcaNombre = componente.idMarcaNavigation ? componente.idMarcaNavigation.nombreMarca : 'Desconocido';
                const tipoComponente = componente.idTipoComponenteNavigation ? componente.idTipoComponenteNavigation.tipo : 'Desconocido';

                const row = `
                    <tr>
                        <td class="idCompOculto">${componente.idComponente}</td>
                        <td>${componente.nombre}</td>
                        <td>${marcaNombre}</td>
                        <td>${tipoComponente}</td>
                        <td>$${componente.precio.toFixed(2)}</td>
                        <td>${componente.stock}</td>
                        <td>${componente.stockMinimo}</td>
                        <td>${estado}</td>
                        <td class="sorting_1">
                            <div class="form-button-action">
                                <button type="button" data-id="${componente.idComponente}" data-bs-toggle="tooltip" title="Edit Task" class="btn btn-link btn-primary btn-lg">
                                    <i class="fa fa-edit"></i>
                                </button>
                                <button type="button" data-id="${componente.idComponente}" data-bs-toggle="tooltip" title="Remove" class="btn btn-link btn-danger">
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                `;
                tbody.insertAdjacentHTML("beforeend", row);
            });
        } else  // FUNCIONALIDAD PARA CUANDO SOLO SE DESEA CARGAR UN COMPONENTE
        {
            const estado = data.estado ? "Activo" : "Inactivo";
            const marcaNombre = data.idMarcaNavigation ? data.idMarcaNavigation.nombreMarca : 'Desconocido';
            const tipoComponente = data.idTipoComponenteNavigation ? data.idTipoComponenteNavigation.tipo : 'Desconocido';

            const row = `
                <tr>
                    <td class="idCompOculto">${data.idComponente}</td>
                    <td>${data.nombre}</td>
                    <td>${marcaNombre}</td>
                    <td>${tipoComponente}</td>
                    <td>$${data.precio.toFixed(2)}</td>
                    <td>${data.stock}</td>
                    <td>${data.stockMinimo}</td>
                    <td>${estado}</td>
                    <td class="sorting_1">
                        <div class="form-button-action">
                            <button type="button" data-id="${data.idComponente}" data-bs-toggle="tooltip" title="Edit Task" class="btn btn-link btn-primary btn-lg">
                                <i class="fa fa-edit"></i>
                            </button>
                            <button type="button" data-id="${data.idComponente}" data-bs-toggle="tooltip" title="Remove" class="btn btn-link btn-danger">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                    </td>
                </tr>
            `;
            tbody.insertAdjacentHTML("beforeend", row);
        }

        // Añadir event listeners a los botones de editar
        document.querySelectorAll('.btn-primary').forEach(button => {
            button.addEventListener('click', function () {
                const idComponente = this.dataset.id; // Obtener el ID del componente
                abrirModalEdicion(idComponente); // Cargar los datos en el modal
            });
        });

        document.querySelectorAll('.btn-danger').forEach(button => {
            button.addEventListener('click', function () {
                const componenteId = this.dataset.id;
        
                // Mostrar alerta de confirmación usando SweetAlert
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
                            text: "Sí, eliminar",
                            className: "btn btn-success",
                        },
                    },
                }).then((willDelete) => {
                    if (willDelete) {
                        // Si el usuario confirma, llama a bajaComponente
                        bajaComponente(componenteId);
                    } else {
                        swal("Operación cancelada", "Su familia esta a salvo.", {
                            buttons: {
                                confirm: {
                                    className: "btn btn-success",
                                },
                            },
                        });
                    }
                });
            });
        });

    } catch (error) {
        console.error('Error al cargar los componentes:', error);
    }
}
//funcion para dar de baja el componente
async function bajaComponente(id) {
    await fetch(`https://localhost:7119/api/Componente/Low-Componente?id=${id}`, {
        method: 'PUT'
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al dar de baja el componente');
            }
            swal("Éxito", "Componente dado de baja exitosamente.", "success");
            cargarComponentes(`https://localhost:7119/api/Componente/GetById-Componente?id=${id}`, "uno"); // Recarga la tabla de componentes para reflejar el cambio
        })
        .catch(handleError);
}


//funcion para recargar el modal con el componente elegido
async function cargarModalComponente(id) {
    fetch(`https://localhost:7119/api/Componente/GetById-Componente?id=${id}`)
        .then(response => response.json())
        .then(componente => {
            document.getElementById("idComponente").value = componente.idComponente;
            document.getElementById("nombre").value = componente.nombre;
            document.getElementById("precio").value = componente.precio;
            document.getElementById("stock").value = componente.stock;
            document.getElementById("stockMinimo").value = componente.stockMinimo;


            // Cargar los combos de marcas y tipos
            cargarDatosCombos().then(() => {
                // Ajustar los valores seleccionados en los combos
                document.getElementById("marca").value = componente.idMarca; // Establecer la marca seleccionada
                document.getElementById("tipoComponente").value = componente.idTipoComponente; // Establecer el tipo de componente seleccionado
            });
        })
        .catch(error => console.error('Error al cargar los datos del componente:', error));
}


//funcion para manejar el modal segun su modo Edicion/creacion
let esModoEdicion = false;

// Función para abrir el modal en modo creación
document.getElementById("abrirModalNuevoComponenteBtn").addEventListener("click", function () {
    esModoEdicion = false;
    limpiarFormulario(); // Limpia el formulario para comenzar desde cero
    document.querySelector(".modal-title").textContent = "Crear Componente";
    cargarDatosCombos();
    document.getElementById("guardarCambiosBtn").textContent = "Crear Componente";
    const modal = new bootstrap.Modal(document.getElementById('modalEditarComponente'));
    modal.show();
});


// Función para abrir el modal en modo edición
function abrirModalEdicion(idComponente) {
    if(idComponente != undefined)
    {
        esModoEdicion = true;
        cargarModalComponente(idComponente); // Cargar datos para editar
        document.querySelector(".modal-title").textContent = "Editar Componente";
        document.getElementById("guardarCambiosBtn").textContent = "Guardar Cambios";
        const modal = new bootstrap.Modal(document.getElementById('modalEditarComponente'));
        modal.show();
    }
}
function verificarCampos() {
    // Obtener los valores de los campos
    const nombre = document.getElementById("nombre").value;
    const precio = parseFloat(document.getElementById("precio").value);
    const stock = parseInt(document.getElementById("stock").value);
    const stockMinimo = parseInt(document.getElementById("stockMinimo").value);
    const idMarca = document.getElementById("marca").value;
    const idTipoComponente = document.getElementById("tipoComponente").value;

    // Validaciones
    if (!nombre || !precio || !stock || !stockMinimo || !idMarca || !idTipoComponente) {
        swal("Error", "Todos los campos deben estar completos.", "warning");
        return false;
    }
    if (precio <= 0) {
        swal("Error", "El precio debe ser un valor mayor a 0.", "warning");
        return false;
    }
    if (stock <= 0 || stockMinimo <= 0) {
        swal("Error", "El stock y el stock mínimo deben ser valores mayores a 0.", "warning");
        return false;
    }
    if (nombre.length > 150) {
        swal("Error", "El nombre no puede tener más de 150 caracteres.", "warning");
        return false;
    }

    // Si todas las validaciones pasan, retorna true
    return true;
}
//funcion en el boton guardar del Modal para guardar los cambios y hacer put 

document.getElementById("guardarCambiosBtn").addEventListener("click", function () {
    if (!verificarCampos()) {
        return;
    }
    const datos = {
        nombre: document.getElementById("nombre").value,
        precio: parseFloat(document.getElementById("precio").value),
        stock: parseInt(document.getElementById("stock").value),
        stockMinimo: parseInt(document.getElementById("stockMinimo").value),
        idMarca: document.getElementById("marca").value,
        idTipoComponente: document.getElementById("tipoComponente").value,
        estado: true

    };
    const marca = document.getElementById("marca").value;
    const tipo = document.getElementById("tipoComponente").value;
    if (esModoEdicion) {
        datos.idComponente  = document.getElementById('idComponente').value;
        fetch('https://localhost:7119/api/Componente/Update-Componente', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(datos)
        })
            
            .then(response => handleResponse(response,marca,tipo))
            .catch(handleError)
    }
    else {
        fetch(`https://localhost:7119/api/Componente/Create-Componente`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(datos)
        })
            .then(response => handleResponse(response,marca,tipo))
            .catch(handleError)
    }
}

)

function cerrarModal() {
    const modalInstance = bootstrap.Modal.getInstance(document.getElementById('modalEditarComponente'));
    if (modalInstance) modalInstance.hide(); // Asegura eliminar completamente el modal

    // Eliminar cualquier backdrop remanente
    const backdrops = document.querySelectorAll('.modal-backdrop');
    backdrops.forEach(backdrop => backdrop.remove());
}

// Asignamos esta función al botón de cerrar
document.getElementById("cerrarModal").addEventListener("click", cerrarModal);

//funcion que limpie el modal antes de abrirlo
function limpiarFormulario() {
    document.getElementById("formEditarComponente").reset();
    document.getElementById("idComponente").value = ""; // Deja el id vacío en modo creación
}


// Función para manejar la respuesta del servidor
function handleResponse(response, marca, tipo) {
    if (!response.ok) {
        throw new Error("Error en la operación");
    }
    swal("Éxito", esModoEdicion ? "Componente actualizado exitosamente." : "Componente creado exitosamente.", "success")
        .then(() => {
            let urlComponente = `https://localhost:7119/api/Componente/GetAllFiltro-Componentes?estado=${true}&tipoComponenteId=${tipo}&marcaId=${marca}`;
            cargarComponentes(urlComponente, "muchos"); // Recargar la tabla
            cerrarModal();
        });
}


// Función para manejar errores
function handleError(error) {
    console.error(error);
    swal("Error", "Ocurrió un error al realizar la operación.", "error");
}


//funcion para cargar los combos de marcas y tipos de  componentes en el modal

async function cargarDatosCombos() {
    return Promise.all([
        await fetch('https://localhost:7119/api/Marca/GetAll-Marcas')
            .then(response => response.json())
            .then(marcas => {
                const selectMarca = document.getElementById("marca");
                selectMarca.innerHTML = ""; // Limpia el combo antes de agregar nuevas opciones
                marcas.forEach(marca => {
                    const option = document.createElement("option");
                    option.value = marca.idMarca; // valor que seleccionamos 
                    option.textContent = marca.nombreMarca; // y el nombre visible
                    selectMarca.appendChild(option);
                });
            })
            .catch(error => console.error('Error al cargar marcas:', error)),

        await fetch('https://localhost:7119/api/TipoComponente/GetAll-TiposComponente')
            .then(response => response.json())
            .then(tipos => {
                const selectTipo = document.getElementById("tipoComponente");
                selectTipo.innerHTML = ""; // Limpia el combo antes de agregar nuevas opciones
                tipos.forEach(tipo => {
                    const option = document.createElement("option");
                    option.value = tipo.idTipoComponente;
                    option.textContent = tipo.tipo;
                    selectTipo.appendChild(option);
                });
            })
            .catch(error => console.error('Error al cargar tipos:', error))
    ]);
}

async function cargarDatosCombosTabla() {
    try {
        const [marcas, tipos] = await Promise.all([
            fetch('https://localhost:7119/api/Marca/GetAll-Marcas').then(response => response.json()),
            fetch('https://localhost:7119/api/TipoComponente/GetAll-TiposComponente').then(response => response.json())
        ]);

        const tipoDropdown = document.getElementById("tipo-componente");
        const marcaDropdown = document.getElementById("marcas");

        tipoDropdown.innerHTML = '<li><a class="dropdown-item" href="#" data-value="0">TODOS</a></li>';
        marcaDropdown.innerHTML = '<li><a class="dropdown-item" href="#" data-value="0">TODAS</a></li>';

        tipos.forEach(tipo => {
            const li = document.createElement("li");
            li.innerHTML = `<a class="dropdown-item" href="#" data-value="${tipo.idTipoComponente}">${tipo.tipo}</a>`;
            tipoDropdown.appendChild(li);
        });

        marcas.forEach(marca => {
            const li = document.createElement("li");
            li.innerHTML = `<a class="dropdown-item" href="#" data-value="${marca.idMarca}">${marca.nombreMarca}</a>`;
            marcaDropdown.appendChild(li);
        });

    } catch (error) {
        console.error('Error loading dropdown data:', error);
    }
}
cargarDatosCombosTabla();


document.getElementById("cargarComponentesBtn").addEventListener("click", async () => {
    const tipoSelected = document.querySelector("#tipo-componente .dropdown-item.active");
    const marcaSelected = document.querySelector("#marcas .dropdown-item.active");
    const estadoSelected = document.querySelector("#estado .dropdown-item.active");

    const tipoComponenteId = tipoSelected ? tipoSelected.getAttribute("data-value") : "0";
    const marcaId = marcaSelected ? marcaSelected.getAttribute("data-value") : "0";
    const estado = estadoSelected
        ? (estadoSelected.getAttribute("data-value") === "INACTIVO" ? false : true) : true;

    try {
        let url = `https://localhost:7119/api/Componente/GetAllFiltro-Componentes?estado=${estado}&tipoComponenteId=${tipoComponenteId}&marcaId=${marcaId}`;
        cargarComponentes(url, "muchos");
    } catch (error) {
        console.error('Error fetching components:', error);
    }
});

document.querySelectorAll(".dropdown-menu").forEach(menu => {
    menu.addEventListener("click", function (event) {
        if (event.target.classList.contains("dropdown-item")) {
            event.preventDefault();

            // Remueve la clase 'active' de todos los elementos del menú
            this.querySelectorAll(".dropdown-item").forEach(item => item.classList.remove("active"));

            // Agrega la clase 'active' solo al elemento seleccionado
            event.target.classList.add("active");

        }
    });
});

