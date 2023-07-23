<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pacientes.aspx.cs" Inherits="Citas_Medicas.WebForm7" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="icon" type="image/png" sizes="16x16" href="../img/logo.png">
    <title>Inicio</title>
    
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
                        <a href="inicioDoc.aspx" class="non-style-link-menu">
                            <div>
                                <p class="menu-text">Inicio</p>
                            </div>
                        </a>
   
                    </td>
                </tr>

                 <tr class="menu-row">
                    <td class="menu-btn menu-icon-home menu-active menu-icon-home-active">
                        <a href="pacientes.aspx" class="non-style-link-menu non-style-link-menu-active">
                            </a><div><a href="pacientes.aspx" class="non-style-link-menu non-style-link-menu-active">
                                <p class="menu-text">Pacientes</p>
                        </a>
                    </div>
                    </td>
                </tr>
                <tr class="menu-row">
                    <td class="menu-btn menu-icon-configDoc">
                        <a href="configDoc.aspx" class="non-style-link-menu">
                            <div>
                                <p class="menu-text">Configuración</p>
                            </div>
                        </a>
                    </td>
                </tr>
               

    </tbody></table>
    </div>

    <div class="dash-body" style="margin-top: 15px">
        <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

            <tbody>
                <tr>
                    <td colspan="1" class="nav-bar">
                        <p style="font-size: 32px; padding-left:12px; font-weight: 600; margin-left:20px;">Pacientes</p>
                    </td>
                    <td width="25%"></td>
                    <td width="15%">
                        <p style="font-size: 14px; color: rgb(119, 119, 119); padding: 0; margin: 0; text-align: right;">Fecha</p>
                        <p class="heading-sub12" style="padding: 0; margin: 0;">2023-06-27</p>
                    </td>
                    <td width="10%">
                        <button class="btn-label" style="display: flex; justify-content: center; align-items: center;">
                            <img src="../img/calendar.svg" width="100%">
                        </button>
                    </td>
                </tr>
                
                <tr>
                    <td class="label-td" colspan="2">
                        Fecha:
                    </td>
                    <td class="label-td" colspan="2">
                        <input type="text" name="fecha" class="input-text" required>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        Paciente:
                    </td>
                    <td class="label-td" colspan="2">
                        <input type="text" name="paciente" class="input-text" required>
                    </td>
                </tr>
                <tr>
                <td colspan="4" style="text-align: center;">
                    <button class="btn-primary-soft btn" onclick="buscar()">Buscar</button>
                </td>
            </tr>
            </tbody>



                </td>
            </tr>
        
            <tr>
                <td colspan="4">
                    <form runat="server">
                    <table border="0" width="100%" "="">
                            <tbody><tr>
                                <td width=" 50%">


                    <p style="font-size: 20px;font-weight:600;padding-left: 80px;" class="anime"></p>
                    <center>
                        <div class="abc scroll" style="height: 600px;padding: 0;margin: 0;">
                            <table width="0%" class="sub-table scrolldown" border="0">
                                <asp:Table ID="citas_medico" class="sub-table scrolldown" runat="server">
                                    <asp:TableHeaderRow>
                                        <asp:TableHeaderCell>Nro Citas</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Paciente</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Fecha y Hora</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Acciones</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                            </table>
                        </div>
                    </center>

                </td>
            </tr>
        </tbody></table></form>
        </td>
        </tr></tbody></table>
    </div>
    </div>




</body>

</html>
