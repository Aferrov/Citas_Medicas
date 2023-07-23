<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docInfo.aspx.cs" Inherits="Citas_Medicas.WebForm19" %>


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
    <form id="form1" runat="server">
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
        
        <div >
            <table border="0">
                <tr>
                        <td class="label-td" colspan="2">
                            <label for="name" class="form-label">Nombre: </label>
                        </td>
                </tr>
                <tr>
                    <td class="label-td">
                        <asp:TextBox ID="nombre" class="input-text" placeholder="Nombre" runat="server"></asp:TextBox>
                    </td>
                    <td class="label-td">
                        <asp:TextBox ID="apellido" class="input-text" placeholder="Apellido" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <label for="address" class="form-label">Dirección: </label>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <asp:TextBox ID="direccion" class="input-text" placeholder="Dirección" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <label for="dob" class="form-label">Fecha de Nacimiento: </label>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <asp:TextBox ID="fec_nac" TextMode="Date" placeholder="Fecha de Nacimiento" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <label for="dob" class="form-label">Correo: </label>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <asp:TextBox ID="correo" class="input-text" placeholder="Correo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <label for="dob" class="form-label">Especialidad: </label>
                    </td>
                </tr>
                
                <tr>
                    <td class="label-td" colspan="2">
                        <asp:DropDownList ID="list_esp"  runat="server">
                        </asp:DropDownList>
                        
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="auto-style1">
                        <asp:Button ID="btn_editar" class="login-btn btn-primary btn" runat="server" Text="Editar" OnClick="btn_editar_Click" />
           
                    </td>

                </tr>
               

            </table>

        </div>

        
    </center>
      
        


            </table>
        </div>
    </div>
    </form>
