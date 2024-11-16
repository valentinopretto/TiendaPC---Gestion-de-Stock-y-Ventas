document.addEventListener("DOMContentLoaded", async function() {
    // Obtener el parámetro 'id' de la URL
    const urlParams = new URLSearchParams(window.location.search);
    const pedidoId = urlParams.get('id');

    if (pedidoId) {
        await cargarPedido(pedidoId);
        await cargarDetallesPedido(pedidoId);
    } else {
        swal("Error", "No se pudo cargar el detalle del pedido", "warning");
        console.error("No se encontró la ID del pedido en la URL.");
    }
});
async function cargarPedido(id) {
    try {
        const response = await fetch(`https://localhost:7119/api/Pedido/Get-PedidoDto?id=${id}`);
        if (response.ok) {
            const pedido = await response.json();
            // Llenar los inputs con los datos del pedido
            document.getElementById('nombreCliente').value = pedido.nombreCliente;
            document.getElementById('nombreEmpleado').value = pedido.nombreEmpleado;
            document.getElementById('fechaPedido').value = new Date(pedido.fechaPedido).toLocaleDateString();
            document.getElementById('total').value = '$'+ pedido.total;
            document.getElementById('nombreFormaPago').value = pedido.nombreFormaPago;
            document.getElementById('estado').value = pedido.estado;
            document.querySelector('h3').textContent = `Detalle del Pedido ${id}`;
        } else {
            console.error("Error al obtener los datos del pedido:", response.statusText);
        }
    } catch (error) {
        console.error("Error al cargar el pedido:", error);
    }
}

async function cargarDetallesPedido(idPedido) {
    try {
        const response = await fetch(`https://localhost:7119/api/Pedido/GetAll-DetallesPedido?idPedido=${idPedido}`);
        if (response.ok) {
            const detalles = await response.json();
            const tabla = document.getElementById('tabla-DetallePedidos');
            tabla.innerHTML = ''; // Limpiar la tabla antes de agregar los nuevos datos

            detalles.forEach(detalle => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${detalle.nombreComponente}</td>
                    <td>${detalle.tipoComponente}</td>
                    <td>${detalle.marcaComponente}</td>
                    <td>${detalle.preUnitario}</td>
                    <td>${detalle.cantidad}</td>
                `;
                tabla.appendChild(row);
            });
        } else {
            console.error("Error al obtener los detalles del pedido:", response.statusText);
        }
    } catch (error) {
        console.error("Error al cargar los detalles del pedido:", error);
    }
}

document.getElementById("cerrarDetalle").addEventListener("click", cerrarPantallaDetalle);

function cerrarPantallaDetalle(){
  window.location.href = `pedidos.html`;
}