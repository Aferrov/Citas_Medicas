<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina_Inicio.aspx.cs" Inherits="Citas_Medicas.Pagina_Inicio" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">  
    <link rel="stylesheet" href="../css/main.css">  
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/slick.css"> 
    <title>Sistema de Citas</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./img/logo.png">
    
</head>
<body>
    <div class="full-height">
        <center>
        <table border="0">
            <tbody>
                <tr>
                    <td width="80%">
                        <font class="edoc-logo"><a href="https://www.configuroweb.com/46-aplicaciones-gratuitas-en-php-python-y-javascript/#Aplicaciones-gratuitas-en-PHP,-Python-y-Javascript" style="color:white; text-decoration: none;">Centro Tópico UNSA</a></font>
                        <font class="edoc-logo-sub">| Sistema de Citas</font>
                    </td>
                    <td width="10%">
                       <a href="Login.aspx" class="non-style-link"><p class="nav-item">Acceder</p></a>
                    </td>
                    <td width="10%">
                        <a href="Registro.aspx" class="non-style-link"><p class="nav-item" style="padding-right: 10px;">Regístrate</p></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <img src="../img/centro1.jpg" width="25%">
                        </center>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p class="heading-text">Sistema de Citas en Línea</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p class="sub-text2">Un conveniente y fácil sistema de citas para estudiantes universitarios.<br>
                        Te ofrecemos varios servicios como Medicina General, Psicología, Dental, Nutrición. Pide ya tu cita.</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <center>
                            <a href="Login.aspx">
                                <input type="button" value="Reserva tu cita" class="login-btn btn-primary btn" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 10px;">
                            </a>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                       
                    </td>
                </tr>
            </tbody>
        </table>
     </center>
    </div>

    <script src="../js/slick.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            $('.slider').slick();
        });
    </script>
</body>
</html>

