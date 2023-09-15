<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Procesar Formulario</title>
</head>
<body>
    <%
        // Obtener los datos del formulario
        int no_cliente = Integer.parseInt(request.getParameter("no_cliente"));
        String cliente = request.getParameter("cliente");
        String producto = request.getParameter("producto");
        int no_operacion = Integer.parseInt(request.getParameter("no_operacion"));
        String abogado = request.getParameter("abogado");
        String fecha_asignacion = request.getParameter("fecha_asignacion");
        String estatus = request.getParameter("estatus");
        double monto_demandado = Double.parseDouble(request.getParameter("monto_demandado"));
        String tipo_inmueble = request.getParameter("tipo_inmueble");
        String garantia = request.getParameter("garantia");
        String descubierto_garantia = request.getParameter("descubierto_garantia");
        double valor_avaluo = Double.parseDouble(request.getParameter("valor_avaluo"));
        String fecha_avaluo = request.getParameter("fecha_avaluo");
        String empresa_avaluadora = request.getParameter("empresa_avaluadora");
        String juzgado = request.getParameter("juzgado");
        int expediente = Integer.parseInt(request.getParameter("expediente"));
        String comentario = request.getParameter("comentario");
        String fecha_finalizacion = request.getParameter("fecha_finalizacion");
        double porcentaje_honorarios = Double.parseDouble(request.getParameter("porcentaje_honorarios"));
        double pendiente_pago_2020 = Double.parseDouble(request.getParameter("pendiente_pago_2020"));
        double pendiente_pago_2021 = Double.parseDouble(request.getParameter("pendiente_pago_2021"));
        String estimacion_gastos_adjudicacion = request.getParameter("estimacion_gastos_adjudicacion");

        // Configurar la conexión a la base de datos
        String jdbcUrl = "jdbc:mysql://localhost:3306/banescoinnova";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Insertar los datos en la tabla informacion_casos
            String sql = "INSERT INTO informacion_casos (no_cliente, cliente, producto, no_operacion, abogado, fecha_asignacion, estatus, monto_demandado, tipo_inmueble, garantia, descubierto_garantia, valor_avaluo, fecha_avaluo, empresa_avaluadora, juzgado, expediente, comentario, fecha_finalizacion, porcentaje_honorarios, pendiente_pago_2020, pendiente_pago_2021, estimacion_gastos_adjudicacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, no_cliente);
            preparedStatement.setString(2, cliente);
            preparedStatement.setString(3, producto);
            preparedStatement.setInt(4, no_operacion);
            preparedStatement.setString(5, abogado);
            preparedStatement.setString(6, fecha_asignacion);
            preparedStatement.setString(7, estatus);
            preparedStatement.setDouble(8, monto_demandado);
            preparedStatement.setString(9, tipo_inmueble);
            preparedStatement.setString(10, garantia);
            preparedStatement.setString(11, descubierto_garantia);
            preparedStatement.setDouble(12, valor_avaluo);
            preparedStatement.setString(13, fecha_avaluo);
            preparedStatement.setString(14, empresa_avaluadora);
            preparedStatement.setString(15, juzgado);
            preparedStatement.setInt(16, expediente);
            preparedStatement.setString(17, comentario);
            preparedStatement.setString(18, fecha_finalizacion);
            preparedStatement.setDouble(19, porcentaje_honorarios);
            preparedStatement.setDouble(20, pendiente_pago_2020);
            preparedStatement.setDouble(21, pendiente_pago_2021);
            preparedStatement.setString(22, estimacion_gastos_adjudicacion);

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