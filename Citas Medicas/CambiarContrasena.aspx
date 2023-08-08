<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarContrasena.aspx.cs" Inherits="Citas_Medicas.WebForm12" %>

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
            else {
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
    <script type="text/javascript">
        function changeTextMode() {
        var checkBox = document.getElementById("CheckContra");
        var textContraAnt = document.getElementById("TextContraAnt");
        var textContraNue = document.getElementById("TextContraNue");
        var textContraNueConf = document.getElementById("TextContraNueConf");

        if (checkBox.checked) {
            textContraAnt.type = "text";
            textContraNue.type = "text";
            textContraNueConf.type = "text";
        } else {
            textContraAnt.type = "password";
            textContraNue.type = "password";
            textContraNueConf.type = "password";
        }
    }
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



    <form id="form1" runat="server">
        <div class="dash-body" style="margin-top: 0px">
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">

                 
                            <center>
                                <br><br><br><br>
                                <div>
                                    <asp:Label ID="Label1" runat="server" Text="Contraseña Anterior"></asp:Label>
                                </div>
                                <div>
                                    <asp:TextBox ID="TextContraAnt" TextMode="Password" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label2" runat="server" Text="Contraseña Nueva"></asp:Label>
                                </div>
                                <div>
                                    <asp:TextBox ID="TextContraNue" TextMode="Password" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label3" runat="server" Text="Contraseña Nueva Confirmación"></asp:Label>
                                </div>
                                <div>
                                    <asp:TextBox ID="TextContraNueConf" TextMode="Password" runat="server"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:CheckBox ID="CheckContra" runat="server" onchange="changeTextMode()" />
                                    <asp:Label ID="Label4" runat="server" Text="Mostrar Contraseñas"></asp:Label>
                                </div>
                                <div>
                                    <asp:Button ID="ButtonCambiar" runat="server" Text="Cambiar" OnClick="ButtonCambiar_Click" />
                                </div>

                           
                            </center>
                       


            </table>
        </div>
       </form>
    </div>
</body>
</html>
    
