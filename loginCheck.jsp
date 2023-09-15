<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Procesando inicio de sesión</title>
</head>
<body>
    <h2>Procesando inicio de sesión</h2>

    <% 
        // Configuración de conexión a la base de datos
        String url = "jdbc:mysql://localhost:3306/banescoinnova";
        String user = "root";
        String password = "";

        // Obtén los parámetros del formulario
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Establece la conexión con la base de datos
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            // Crea la consulta para verificar las credenciales
            String query = "SELECT * FROM Usuario WHERE usuario = ? AND contrasena = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, usuario);
            pstmt.setString(2, contrasena);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Inicio de sesión exitoso
                String tipoUsuario = rs.getString("usuario"); // Suponiendo que hay un campo "tipoUsuario" en tu tabla
                
                if ("admin".equals(tipoUsuario)) {
                    response.sendRedirect("InternoFiles/Home.html"); // Redirecciona a la página de inicio de sesión para el administrador
                } else if ("externo".equals(tipoUsuario)) {
                    response.sendRedirect("AbogadosFiles/HomeA.html"); // Redirecciona a la página de inicio de sesión para el usuario normal
                } else {
                    out.println("Inicio de sesión exitoso para el usuario: " + usuario);
                }
            } else {
                // Credenciales incorrectas
                out.println("Inicio de sesión fallido. Credenciales incorrectas.");
            }
        } catch (Exception e) {
            out.println("Error al procesar el inicio de sesión: " + e.getMessage());
        } finally {
            // Cierra la conexión y el PreparedStatement
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>



