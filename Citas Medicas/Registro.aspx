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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="icon" type="image/png" sizes="16x16" href="./img/logo.png">

    <title>Regístrate</title>

    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
    </style>
    <script type="text/javascript">
    
    function validar_Contenido() {
        var nom, ape, usu, con;
        nom = document.getElementById("nombre").value;
        ape = document.getElementById("apellido").value;
        usu = document.getElementById("usuario").value;
        con = document.getElementById("contrasena").value;

        if (/^[a-zA-ZñÑ\s]+$/.test(nom) == false) {
            alert("Error en Nombres");
            document.getElementById("nombre").value = "";
            
        }
        else if (/^[a-zA-ZñÑ\s]+$/.test(ape) == false) {
            alert("Error en Apellidos");
            document.getElementById("apellido").value = "";
            
        }
        else if (string.IsNullOrEmpty(usu)) {
             mostrarAlert("Usuario no puede ser vacio");
             
        }
        else if (usu.Length > 15)
        {
            mostrarAlert("Usuario no puede ser mayor a 15 caracteres");
        }
        else if (string.IsNullOrEmpty(con)) {
            mostrarAlert("Contraseña no puede ser vacio");

        }
        else if (con.Length > 15) {
            mostrarAlert("Contraseña no puede ser mayor a 15 caracteres");
        }
         else {
                 alert("Usuario registrado");
                 return true;

             }
        return false;
    }
            
    function callAjax() {
        let send1 = $("#nombre").val();
        let send2 = $("#apellido").val();
        let send3 = $("#usuario").val();
        $.ajax({
            url: 'Registro.aspx/UsuarioRegistrado',
            type: 'POST',
            async: true,
            data: '{ "nom" : "' + send1 + '", "ape" : "' + send2 + '", "usu" : "'+ send3+'"}',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                if (response.d == 0) {
                    $("#btn_enviar").show();
                    
                } else if (response.d == 1) {
                    alert("Nombre y Apellidos ya registrados!");
                    $("#btn_enviar").hide();
                }
                else if (response.d == 2) {
                    alert("Usuario ya Registrado!");
                    $("#btn_enviar").hide();
                }
            }
        });
        return false;
    }
    
    </script>

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
                        <asp:TextBox ID="usuario" onBlur="return callAjax();" class="input-text" placeholder="Usuario" runat="server"></asp:TextBox>
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
                        <asp:Button ID="btn_enviar" class="login-btn btn-primary btn" runat="server" Text="Enviar" OnClientClick="return validar_Contenido();" OnClick="btn_enviar_Click" />
           
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
