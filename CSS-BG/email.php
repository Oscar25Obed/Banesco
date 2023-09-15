<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $destinatario = $_POST["destinatario"];
    $mensaje = $_POST["mensaje"];

    // Configura los encabezados del correo
    $cabeceras = "MIME-Version: 1.0" . "\r\n";
    $cabeceras .= "Content-type:text/html;charset=UTF-8" . "\r\n";
    $cabeceras .= "From: oscar251626@gmail.com" . "\r\n"; // Remitente

    // Envía el correo
    if (mail($destinatario, "Asunto del Correo", $mensaje, $cabeceras)) {
        echo "El correo ha sido enviado con éxito a $destinatario.";
    } else {
        echo "Hubo un error al enviar el correo.";
    }
}
?>
