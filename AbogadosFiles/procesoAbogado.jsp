<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*, java.io.*, java.util.*" %>


<%
// Obtener los datos del formulario
int noCliente = Integer.parseInt(request.getParameter("no_cliente"));
String cliente = request.getParameter("cliente");
String producto = request.getParameter("producto");
int noOperacion = Integer.parseInt(request.getParameter("no_operacion"));
String abogado = request.getParameter("abogado");
Date fechaAsignacion = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha_asignacion"));
String estatus = request.getParameter("estatus");
double montoDemandado = Double.parseDouble(request.getParameter("monto_demandado"));
String tipoInmueble = request.getParameter("tipo_inmueble");
String garantia = request.getParameter("garantia");
String descubiertoGarantia = request.getParameter("descubierto_garantia");

// Obtener los documentos del formulario
Part[] archivos = request.getParts();

%>

<%
// Conectarse a la base de datos
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mi_base_datos", "root", "root");
%>

<%
// Insertar los datos en la tabla
String sql = "INSERT INTO Formulario (numero_expediente, fecha_demanda, proceso_demanda, bitacora, carga_documentos, tipoProceso) VALUES (" +
    noCliente + ", '" + fechaAsignacion + "', '" + procesoDemanda + "', '" + bitacora + "', '" + getCargaDocumentos(archivos) + "', '" + tipoProceso + "')";

Statement sentencia = conexion.createStatement();
sentencia.executeUpdate(sql);
%>

<%
// Cerrar la conexión a la base de datos
conexion.close();
%>

<%
// Redireccionar a la página de inicio
response.sendRedirect("HomeA.html");
%>

<%
// Función para obtener la carga de documentos
String getCargaDocumentos(Part[] archivos) {
    String cargaDocumentos = "";

    for (Part archivo : archivos) {
        if (archivo.getSize() > 0) {
            cargaDocumentos += archivo.getSubmittedFileName() + ", ";
        }
    }

    if (cargaDocumentos.length() > 0) {
        cargaDocumentos = cargaDocumentos.substring(0, cargaDocumentos.length() - 2);
    }

    return cargaDocumentos;
}
%>


