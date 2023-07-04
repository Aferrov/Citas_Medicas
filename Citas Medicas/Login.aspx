<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Citas_Medicas.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/login.css">
    <link rel="icon" type="image/png" sizes="16x16" href="./img/logo.png">

    <title>Acceder</title>



</head>

<body>
 <form id="form1" runat="server">
    <center>
        <div class="container">
            <table border="0" style="margin: 0;padding: 0;width: 60%;">
                <tr>
                    <td>
                        <p class="header-text">Hola de nuevo!</p>
                    </td>
                </tr>
                <div class="form-body">
                    <tr>
                        <td>
                            <p class="sub-text">Inicia sesión con tus datos para continuar</p>
                        </td>
                    </tr>
                    <tr>
                           <td class="label-td">
                                <label for="useremail" class="form-label">Usuario: </label>
                            </td>
                    </tr>
                    <tr>
                        <td class="label-td">
                            <asp:TextBox ID="usuario" name="user" class="input-text" placeholder="Usuario" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-td">
                            <label for="userpassword" class="form-label">Contraseña: </label>
                        </td>
                    </tr>

                    <tr>
                        <td class="label-td">
                            <asp:TextBox ID="contrasena" name="userpassword" class="input-text" TextMode="Password" placeholder="Contraseña" runat="server"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td><br>
                            <label for="promter" class="form-label">&nbsp;</label>                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" class="login-btn btn-primary btn" Text="Ingresar" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                </div>
                <tr>
                    <td>
                        <br>
                        <label for="" class="sub-text" style="font-weight: 280;">Aún no tienes cuenta&#63 </label>
                        <a href="Registro.aspx" class="hover-link1 non-style-link">Regístrate</a>
                        <br><br><br>
                    </td>
                </tr>




            </table>

        </div>
    </center>
    </form>
</body>

</html>
