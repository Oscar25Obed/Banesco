document.getElementById('emailForm').addEventListener('submit', function (e) {
    e.preventDefault();
    
    const to = document.getElementById('to').value;
    const subject = document.getElementById('subject').value;
    const message = document.getElementById('message').value;

    // Realiza una solicitud al servidor para enviar el correo electrónico.
    // Aquí puedes utilizar una llamada a la API en el servidor que utilice la lógica que mencioné anteriormente con Node.js y Nodemailer.
    // Por simplicidad, este ejemplo solo mostrará un mensaje en la página.
    const statusElement = document.getElementById('status');
    statusElement.textContent = 'Enviando correo electrónico...';

    // Envía los datos al servidor (debes implementar esta parte en el servidor).
    fetch('/enviarCorreo', {
        method: 'POST',
        body: JSON.stringify({ to, subject, message }),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        statusElement.textContent = data.message;
    })
    .catch(error => {
        statusElement.textContent = 'Error al enviar el correo electrónico: ' + error.message;
    });
});
