<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="citasPacientes.aspx.cs" Inherits="Citas_Medicas.WebForm4" %>


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

    <title>Nueva Cita</title>
    
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
                    <td class="menu-btn menu-icon-Inicio">
                        <a href="inicioPaciente.aspx" class="non-style-link-menu ">
                            </a><div><a href="inicioPaciente.aspx" class="non-style-link-menu">
                                <p class="menu-text">Inicio</p>
                        </a>
        </div>
        </td>
    </tr>
    <tr class="menu-row">
        <td class="menu-btn menu-icon-home menu-active menu-icon-home-active">
            <a href="citasPacientes.aspx" class="non-style-link-menu non-style-link-menu-active">
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
        <td class="menu-btn menu-icon-configPaciente">
            <a href="configPaciente.aspx" class="non-style-link-menu">
                </a><div><a href="configPaciente.aspx" class="non-style-link-menu">
                    <p class="menu-text">Configuración</p>
            </a></div>
        </td>
    </tr>

    </tbody></table>
    </div>
        
        <div class="dash-body" style="margin-top: 15px">
        <form id="form" runat="server">
        <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

            <tbody><tr>
                    <td width="25%">
                        <a href="inicioPacientes.aspx"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px">
                            <font class="tn-in-text">Volver</font>
                        </button></a>
                    </td>
                    <td>
                        <input type="search" name="search" class="input-text header-searchbar" placeholder="Buscar nombre del doctor o correo electrónico" list="doctors">&nbsp;&nbsp;
                            <datalist id="doctors">
                                
                            </datalist>
                            <input type="Submit" value="Búsqueda" class="login-btn btn-primary btn" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 10px;">
                        
                    </td>
                    <td width="15%">
                        <p style="font-size: 14px;color: rgb(119, 119, 119);padding: 0;margin: 0;text-align: right;">
                            Fecha
                        </p>
                        <asp:Label ID="Fecha_Actual" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td width="10%">
                        <button class="btn-label" style="display: flex;justify-content: center;align-items: center;"><img src="../img/calendar.svg" width="100%"></button>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Especialidades:"></asp:Label>
                    
                </td>
                <td>
                    <asp:DropDownList ID="list_especialidades" runat="server" OnSelectedIndexChanged="list_especialidades_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </td>
                

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Horario:"></asp:Label>
                    
                </td>
                <td>
                    <asp:DropDownList ID="list_Horarios" runat="server" AutoPostBack="true"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Médicos:"></asp:Label>
                    
                </td>
                <td>
                    <asp:DropDownList ID="list_Doctores" runat="server"  AutoPostBack="true"></asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="BtnReservar" runat="server" Text="Reservar Cita" />
                </td>
            </tr>
            <tr>
                
                <td colspan="4">

                    <center>
                        
                        <div class="abc scroll">
                <div class="schedule-container">
                  <p class="schedule-heading">Horario:</p>
                    <asp:Table ID="TableHorario" runat="server">
                        <asp:TableHeaderRow>
                                        <asp:TableHeaderCell>Horas</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Lunes</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Martes</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Miercoles</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Jueves</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Viernes</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                    </asp:Table>
                </div>
              </div>
                    </center>
            </tbody>
        </form>
    </div>
      
     
  </div>

</body>

</html>
