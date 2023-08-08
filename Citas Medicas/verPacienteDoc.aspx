<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verPacienteDoc.aspx.cs" Inherits="Citas_Medicas.WebForm17" %>

<!DOCTYPE html>
<html>
<head>
    <title>Título de la página</title>
    <script src="https://d3js.org/d3.v7.min.js"></script>
</head>
<body>
    <!-- Contenido de la página -->
    <div id="grafico"></div>
    <!-- Aquí es donde se generará el gráfico -->
    <script>
        // Datos para el gráfico (puedes cambiar estos valores)
        var datos = [10, 20, 30, 40, 50];

        // Ancho y alto del gráfico
        var ancho = 400;
        var alto = 200;

        // Escala para ajustar los datos al tamaño del gráfico
        var escala = d3.scaleLinear()
            .domain([0, d3.max(datos)])
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

