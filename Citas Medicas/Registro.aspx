<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Citas_Medicas.Registro" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/registro.css">
    <link rel="icon" type="image/png" sizes="16x16" href="./img/logo.png">

    <title>Regístrate</title>

    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
    </style>

</head>

<body>
    

    <center>
        <form id="form2" runat="server">
        <div class="container">
            <table border="0">
                <tr>
                    <td colspan="2">
                        <p class="header-text">Registrate</p>
                        <p class="sub-text">Agregue sus datos personales para continuar</p>
                    </td>
                </tr>
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
                        <asp:TextBox ID="fec_nac" class="input-text" TextMode="Date" placeholder="Fecha de Nacimiento" runat="server"></asp:TextBox>
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
                        <label for="dob" class="form-label">Usuario: </label>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <asp:TextBox ID="usuario" class="input-text" placeholder="Usuario" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <label for="dob" class="form-label">Contraseña: </label>
                    </td>
                </tr>
                <tr>
                    <td class="label-td" colspan="2">
                        <asp:TextBox ID="contrasena" class="input-text" placeholder="Contraseña" TextMode="Password" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="auto-style1">
                        <asp:Button ID="btn_enviar" class="login-btn btn-primary btn" runat="server" Text="Enviar" OnClick="btn_enviar_Click" />
           
                    </td>

                </tr>
                <tr>
                    <td colspan="2">
                        <br>
                        <label for="" class="sub-text" style="font-weight: 280;">Ya tienes una cuenta&#63; </label>
                        <a href="Login.aspx" class="hover-link1 non-style-link">Ingresar</a>
                        <br><br><br>
                    </td>
                </tr>

            </table>

        </div>

        </form>
    </center>
</body>

</html>
