<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

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
</body>
</html>