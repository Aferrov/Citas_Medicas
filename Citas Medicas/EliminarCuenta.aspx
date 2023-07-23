<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarCuenta.aspx.cs" Inherits="Citas_Medicas.WebForm14" %>


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
                                    <img src="../img/logo_azul.png" alt="" width="100%" style="border-radius:50%">
                                </td>
                                <td style="padding:0px;margin:0px;">
                                    <asp:Label ID="LabelNombre" runat="server" Text="Nombre"></asp:Label>
                                    <asp:Label ID="LabelCorreo" runat="server" Text="Correo"></asp:Label>
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
                        <a href="inicioPaciente.aspx" class="non-style-link-menu">
                            </a><div><a href="inicioPaciente.aspx" class="non-style-link-menu">
                                <p class="menu-text">Inicio</p>
                        </a>
                        </div>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-citasPacientes">
                            <a href="citasPacientes.aspx" class="non-style-link-menu">
                                <div>
                                    <p class="menu-text">Citas</p>
                                </div>
                            </a>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-historial">
                            <a href="historial.aspx" class="non-style-link-menu">
                                </a><div><a href="historial.aspx" class="non-style-link-menu">
                                    <p class="menu-text">Mi Historial</p>
                            </a></div>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-configPaciente menu-active menu-icon-configPaciente-active">
                            <a href="configPaciente.aspx" class="non-style-link-menu non-style-link-menu-active">
                                </a><div><a href="configPaciente.aspx" class="non-style-link-menu non-style-link-menu-active">
                                    <p class="menu-text">Configuración</p>
                            </a></div>
                        </td>
                    </tr>

                    </tbody></table>
                    </div>



        <div class="dash-body" style="margin-top: 0px">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

                 
                            <center>
                                <h2>Estás segur@?</h2>
                                
                                <div class="content">
                                    Deseas eliminar tu cuenta (Nombre de Usuario).
                                </div>
                                <div style="display: flex;justify-content: center;">
                                    <a href="delete-account.aspx?id=<?aspx echo $id ?>" class="non-style-link">
                                        <button class="btn-primary btn" onclick="window.location.href='delete-appointment.aspx'">
                                        <span class="tn-in-text"></span>
                                        <a href="delete-appointment.aspx" class="hover-link1 non-style-link">Sí</a>
                                    </button>

                                    </a>
                                    <a href="configPaciente.aspx" class="non-style-link">
                                        <button class="btn-primary btn" style="display: flex;justify-content: center;align-items: center;margin:10px;padding:10px;">
                                            <font class="tn-in-text">&nbsp;&nbsp;No&nbsp;&nbsp;</font>
                                        </button>
                                    </a>
                                </div>
                            </center>
                       


            </table>
        </div>
    </div>