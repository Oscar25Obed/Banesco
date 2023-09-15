const nodemailer = require('nodemailer');
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path'); // Agregamos el módulo 'path' para manejar rutas de archivos.


const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public'))); // Servir archivos estáticos desde una carpeta 'public'

const transporter = nodemailer.createTransport({
  host: 'smtp.office365.com', // Cambia esto al servidor SMTP correcto
  port: 587, // Puerto STARTTLS
  secure: false, // Establecer en false porque no estamos utilizando SSL/TLS directamente
  auth: {
    user: 'obed8perez@hotmail.com',
    pass: 'oscar2512',
  },
  tls: {
    rejectUnauthorized: false
  },
});

app.post('/enviar-correo', (req, res) => {
    const { to} = req.body;
  
    const mailOptions = {
      from: 'obed8perez@hotmail.com',
      to,
      subject: 'Certificaciones de saldo Banesco (Panamá), S.A.',
      text: 'Por este medio hacemos de su conocimiento que se le está enviando un grupo de certificaciones de saldo con su debido sustento, para su revisión y posterior refrendo.',
    };
  
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.error('Error al enviar el correo electrónico:', error);
        res.status(500).json({ message: 'Error al enviar el correo electrónico' });
      } else {
        console.log('Correo electrónico enviado con éxito:', info.response);
        res.status(200).json({ message: 'Correo electrónico enviado con éxito' });
      }
    });
  });
  app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'formulario2.html'));
  });
app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});


