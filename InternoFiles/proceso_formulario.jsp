<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.Properties" %>

<!DOCTYPE html>
<html>
<head>
    <title>Procesando Formulario</title>
</head>
<body>
    <%
        // Obtener los datos del formulario
        String tipoCertificacion = request.getParameter("tipoCertificacion");
        String nombre = request.getParameter("nombre");
        String identificacion = request.getParameter("identificacion");
        String nombreCPA = request.getParameter("nombreCPA");
        String fecha = request.getParameter("fecha");
        String identificacionCliente = request.getParameter("identificacionCliente");
        String tipoProducto = request.getParameter("tipoProducto");
        String numeroPrestamo = request.getParameter("numeroPrestamo");
        String nombreApoderadoBanco = request.getParameter("nombreApoderadoBanco");
        String identificacionApoderadoBanco = request.getParameter("identificacionApoderadoBanco");
        String idoneidadApoderadoBanco = request.getParameter("idoneidadApoderadoBanco");
        String saldoCapital = request.getParameter("saldoCapital");
        String intereses = request.getParameter("intereses");
        String gastos = request.getParameter("gastos");
        String feci = request.getParameter("feci");
        String comisionFiduciaria = request.getParameter("comisionFiduciaria");
        String saldoTotal = request.getParameter("saldoTotal");
        String tipoProductoB = request.getParameter("tipoProductoB");
        String numeroPrestamoB = request.getParameter("numeroPrestamoB");
        String saldoTotalB = request.getParameter("saldoTotalB");

        // Configurar la conexión a la base de datos
        String jdbcUrl = "jdbc:mysql://localhost:3306/banescoinnova";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Insertar los datos en la tabla certificaciones
            String sql = "INSERT INTO certificaciones (tipoCertificacion, nombre, identificacion, nombreCPA, fecha, identificacionCliente, tipoProducto, numeroPrestamo, nombreApoderadoBanco, identificacionApoderadoBanco, idoneidadApoderadoBanco, saldoCapital, intereses, gastos, feci, comisionFiduciaria, saldoTotal, tipoProductoB, numeroPrestamoB, saldoTotalB) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, tipoCertificacion);
            preparedStatement.setString(2, nombre);
            preparedStatement.setString(3, identificacion);
            preparedStatement.setString(4, nombreCPA);
            preparedStatement.setString(5, fecha);
            preparedStatement.setString(6, identificacionCliente);
            preparedStatement.setString(7, tipoProducto);
            preparedStatement.setString(8, numeroPrestamo);
            preparedStatement.setString(9, nombreApoderadoBanco);
            preparedStatement.setString(10, identificacionApoderadoBanco);
            preparedStatement.setString(11, idoneidadApoderadoBanco);
            preparedStatement.setString(12, saldoCapital);
            preparedStatement.setString(13, intereses);
            preparedStatement.setString(14, gastos);
            preparedStatement.setString(15, feci);
            preparedStatement.setString(16, comisionFiduciaria);
            preparedStatement.setString(17, saldoTotal);
            preparedStatement.setString(18, tipoProductoB);
            preparedStatement.setString(19, numeroPrestamoB);
            preparedStatement.setString(20, saldoTotalB);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>Datos insertados correctamente en la base de datos.</p>");
            } else {
                out.println("<p>Error al insertar datos en la base de datos.</p>");
            }

            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
    <%
    String para = request.getParameter("to");

    // Configuración del servidor SMTP
    String host = "smtp.gmail.com";  // Cambia según tu proveedor de correo
    String usuario = "obed8perez@hotmail.com";  // Cambia con tu dirección de correo
    String contraseña = "oscar2512";  // Cambia con tu contraseña

    Properties properties = System.getProperties();
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", smtp.office365.com);
    properties.put("mail.smtp.user", obed8perez@hotmail.com);
    properties.put("mail.smtp.password", oscar2512);
    properties.put("mail.smtp.port", "587");
    properties.put("mail.smtp.auth", "false");

    Session session = Session.getDefaultInstance(properties);
    MimeMessage message = new MimeMessage(session);
    try {
        message.setFrom(new InternetAddress(usuario));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(asunto);
        message.setText(mensaje);

        Transport transport = session.getTransport("smtp");
        transport.connect(smtp.office365.com, obed8perez@hotmail.com, oscar2512);
        transport.sendMessage('Por este medio hacemos de su conocimiento que se le está enviando un grupo de certificaciones de saldo con su debido sustento, para su revisión y posterior refrendo.');
        transport.close();

        out.println("Correo enviado correctamente a " + to);
    } catch (MessagingException mex) {
        mex.printStackTrace();
        out.println("Error al enviar el correo: " + mex.getMessage());
    }
%>
</body>
</html>

<%
    String para = request.getParameter("para");
    String asunto = request.getParameter("asunto");
    String mensaje = request.getParameter("mensaje");

    // Configuración del servidor SMTP
    String host = "smtp.gmail.com";  // Cambia según tu proveedor de correo
    String usuario = "tuCorreo@gmail.com";  // Cambia con tu dirección de correo
    String contraseña = "tuContraseña";  // Cambia con tu contraseña

    Properties properties = System.getProperties();
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", host);
    properties.put("mail.smtp.user", usuario);
    properties.put("mail.smtp.password", contraseña);
    properties.put("mail.smtp.port", "587");
    properties.put("mail.smtp.auth", "true");

    Session session = Session.getDefaultInstance(properties);
    MimeMessage message = new MimeMessage(session);

    try {
        message.setFrom(new InternetAddress(usuario));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(para));
        message.setSubject(asunto);
        message.setText(mensaje);

        Transport transport = session.getTransport("smtp");
        transport.connect(host, usuario, contraseña);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

        out.println("Correo enviado correctamente a " + para);
    } catch (MessagingException mex) {
        mex.printStackTrace();
        out.println("Error al enviar el correo: " + mex.getMessage());
    }
%>