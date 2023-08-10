<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="configDoc.aspx.cs" Inherits="Citas_Medicas.WebForm8" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../img/logo.png">

    <title>Configuración</title>
    <script>
        function modoOscuro() {
            var cookies = document.cookie.split(';');
            var darkValue = null;
            var usu = document.getElementById('<%= Cookie.ClientID %>').innerText;;
            var usuario = usu + '=';
            for (var i = 0; i < cookies.length; i++) {
                var cookie = cookies[i].trim();

                if (cookie.indexOf(usuario) === 0) {
                    darkValue = cookie.substring(usuario.length);
                    break;
                }
            }
            if (darkValue == "True") {
                document.body.style.backgroundColor = "black";
                var labels = document.querySelectorAll(".texto");

                labels.forEach(function (label) {
                    label.style.color = "white";
                });
            }
            else
            {
                document.body.style.backgroundColor = "white";
                var labels = document.querySelectorAll(".texto");

                labels.forEach(function (label) {
                    label.style.color = "black";
                });
            }
            return false;
            
        }

        document.addEventListener('DOMContentLoaded', modoOscuro);
    </script>
</head>

<body>
    <div class="container">
         <div class="menu">
            <table class="menu-container" border="0">
                <tbody><tr>
                    <td style="padding:10px" colspan="2">
                        <table border="0" class="profile-container">
                            <tbody><tr>
                                <td width="30%" style="padding-left:20px">
                                   <asp:Label ID="Cookie" runat="server" style="display: none" Text="Label"></asp:Label>
                                    <img src="../img/logo_azul.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <asp:Label ID="LabelNombre" CssClass="texto" runat="server" Text="Nombre"></asp:Label>
                                    <asp:Label ID="LabelCorreo" CssClass="texto" runat="server" Text="Correo"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <a href="Pagina_Inicio.aspx"><input type="button" value="Cerrar Sesión" class="logout-btn btn-primary-soft btn"></a>
                                </td>
                            </tr>
                            </tbody></table>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-home">
                            <a href="inicioDoc.aspx" class="non-style-link-menu">
                                </a><div><a href="inicioDoc.aspx" class="non-style-link-menu">
                                    <p class="menu-text">Inicio</p>
                            </a>
                        </div>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-pacientes">
                            <a href="pacientes.aspx" class="non-style-link-menu">
                                <div>
                                    <p class="menu-text">Pacientes</p>
                                </div>
                            </a>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-configPaciente menu-active menu-icon-configPaciente-active">
                            <a href="configDoc.aspx" class="non-style-link-menu non-style-link-menu-active">
                                </a><div><a href="configDoc.aspx" class="non-style-link-menu non-style-link-menu-active">
                                    <p class="menu-text">Configuración</p>
                            </a></div>
                        </td>
                    </tr>
                   <tr class="menu-row">
                        <td class="menu-btn menu-icon-home">
                            <a href="docReporte.aspx" class="non-style-link-menu">
                                </a><div><a href="docReporte.aspx" class="non-style-link-menu">
                                    <p class="menu-text">Reportes</p>
                            </a>
                        </div>
                        </td>
                    </tr>

                </tbody></table>
                </div>



        <div class="dash-body" style="margin-top: 15px">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

                <tr>

                    <td width="13%">
                        <a href="Pagina_Inicio.aspx"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px">
                                <font class="tn-in-text">Volver</font>
                            </button></a>
                    </td>
                    <td>
                        <p style="font-size: 23px;padding-left:12px;font-weight: 600;">Configuración</p>

                    </td>

                    <td width="15%">
                        <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                            Fecha
                        </p>
                        <asp:Label ID="fechaActual" runat="server" Text="Label"></asp:Label>
                        
                    </td>
                    <td width="10%">
                        <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                    </td>


                </tr>
                <tr>
                    <td colspan="3">

                        <center>
                            <table class="filter-container" style="border: none;" border="0">
                                <tr>
                                    <td colspan="3">
                                        <p style="font-size: 20px">&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <a href="docEditar.aspx" class="non-style-link">
                                            <div class="dashboard-items setting-tabs" style="padding:20px;margin:auto;width:95%;display: flex">
                                                <div class="btn-icon-back dashboard-icons-setting" style="background-image: url('../img/icons/doctors-hover.svg');"></div>

                                             
                                                <div>
                                                    <div class="h1-dashboard">
                                                        Cambiar Contraseña &nbsp;

                                                    </div><br>
                                                    <div class="h3-dashboard texto" style="font-size: 15px;">
                                                        Cambia la Contraseña
                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </td>


                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <p style="font-size: 5px">&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                        <a href="docInfo.aspx" class="non-style-link">
                                            <div class="dashboard-items setting-tabs texto" style="padding:20px;margin:auto;width:95%;display: flex;">
                                                <div class="btn-icon-back dashboard-icons-setting " style="background-image: url('../img/icons/view-iceblue.svg');"></div>


                                                <div>
                                                    <div class="h1-dashboard">
                                                        Ver Información de tu Cuenta

                                                    </div><br>
                                                    <div class="h3-dashboard texto" style="font-size: 15px;">
                                                        Ver o Editar la información personal de tu cuenta
                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <p style="font-size: 5px">&nbsp;</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 25%;">
                                         <div class="dashboard-items setting-tabs" style="padding:20px;margin:auto;width:95%;display: flex;">
                                             
                                             <div class="btn-icon-back dashboard-icons-setting" style="background-image: url('../img/icons/doctors-hover.svg');"></div>

                                                
                                                <div>
                                                    <div class="h1-dashboard">
                                                        Modo Oscuro

                                                    </div><br>
                                                    <div class="h3-dashboard texto" style="font-size: 15px;">
                                                        Activa o desactiva el modo Oscuro
                                                    </div>
                                                    <div class="h3-dashboard texto" style="font-size: 15px;">
                                                        <asp:Label ID="Label1" runat="server" Text="Activado:"></asp:Label>
                            
                                                    </div>
                                                    <form runat="server">
                                                    <div class="h3-dashboard" style="font-size: 15px;">
                                                        <asp:CheckBox ID="CheckDark" runat="server" OnCheckedChanged="CheckDark_CheckedChanged" AutoPostBack="true"/>
                                                    </div>
                                                    </form> 
                                                </div>
                                                 
                                            </div>
                                        
                                    </td>

                                </tr>
                        
                            </table>
                        </center>
                    </td>
                </tr>

            </table>
        </div>
    </div>



</body>

</html>
