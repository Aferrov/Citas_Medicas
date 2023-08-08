<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="docReporte.aspx.cs" Inherits="Citas_Medicas.WebForm24" %>


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
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <title>Reportes</title>
    <script>
        function modoOscuro() {
            var cookies = document.cookie.split(';');
            var darkValue = null;
            var usu = document.getElementById('<%= Cookie.ClientID %>').innerText;
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
                        <td class="menu-btn menu-icon-configPaciente">
                            <a href="configDoc.aspx" class="non-style-link-menu">
                                </a><div><a href="configDoc.aspx" class="non-style-link-menu">
                                    <p class="menu-text">Configuración</p>
                            </a></div>
                        </td>
                    </tr>
                    <tr class="menu-row">
                        <td class="menu-btn menu-icon-home menu-active menu-icon-configPaciente-active">
                            <a href="docReporte.aspx" class="non-style-link-menu non-style-link-menu-active">
                                </a><div><a href="docReporte.aspx" class="non-style-link-menu non-style-link-menu-active">
                                    <p class="menu-text">Reportes</p>
                            </a>
                        </div>
                        </td>
                    </tr>

                </tbody></table>
                </div>



        <div class="container">
        <div class="dash-body" style="margin-top: 0px">
            
    
            <table border="0" width="100%" style=" border-spacing: 0;margin:0;padding:0;">
                <form id="form1" runat="server">
             
                    <center>
        
        <div>
            <table border="0">
                <tbody><tr>
                    <td width="25%">
                        <a href="inicioPacientes.aspx"><button class="login-btn btn-primary-soft btn btn-icon-back" style="padding-top:11px;padding-bottom:11px;margin-left:20px;width:125px">
                            <font class="tn-in-text">Volver</font>
                        </button></a>
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
                    <td class="label-td" colspan="2">
                        <asp:DropDownList ID="list_Mes"  runat="server" AutoPostBack="true">
                        </asp:DropDownList>
                        
                    </td>
                </tr>
                <tr>
                    <div id="grafico" ></div>
                </tr>
               
            </form>
            </table>
            
        </div>

        
    </center>


            </table>
        </div>
        </div>
    </div>
    <script>
        console.log(datos);
        //var datos = [10, 20, 30, 40, 50];
        // Ancho y alto del gráfico
        var ancho = 400;
        var alto = 200;

        // Escala para ajustar los datos al tamaño del gráfico
        var escala = d3.scaleLinear()
            .domain([0, 20])
            .range([0, alto]);

        // Crear el lienzo SVG para el gráfico
        var lienzo = d3.select("#grafico")
            .append("svg")
            .attr("width", ancho)
            .attr("height", alto);

        // Crear las barras en el gráfico
        lienzo.selectAll("rect")
            .data(datos)
            .enter()
            .append("rect")
            .attr("x", function (d, i) { return i * 60; }) // Espaciado entre las barras
            .attr("y", function (d) { return alto - escala(d); })
            .attr("width", 50) // Ancho de las barras
            .attr("height", function (d) { return escala(d); })
            .attr("fill", "steelblue"); // Color de las barras (puedes cambiarlo)

        // Agregar etiquetas a las barras
        lienzo.selectAll("text")
            .data(datos)
            .enter()
            .append("text")
            .text(function (d) { return d; }) // Texto de la etiqueta (en este caso, mostramos el valor de cada dato)
            .attr("x", function (d, i) { return i * 60 + 25; }) // Posición x de la etiqueta (centrado en la barra)
            .attr("y", function (d) { return alto - escala(d) - 5; }) // Posición y de la etiqueta (5 píxeles por encima de la barra)
            .attr("text-anchor", "middle") // Alineación del texto en el centro
            .attr("font-size", "12px") // Tamaño de fuente del texto
            .attr("fill", "black"); // Color de fuente del texto
    </script>
    </body>
    </html>
