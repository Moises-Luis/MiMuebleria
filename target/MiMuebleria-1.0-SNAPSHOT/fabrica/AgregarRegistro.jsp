<%--
  Created by IntelliJ IDEA.
  User: benjamin
  Date: 24/08/21
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Registros.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">--%>
    <title>Title</title>
    
</head>
<body>
<h1 id="msgError"></h1>
    <h1 id = "h1"></h1>

<div class="wrapper" id="wrapper">
    <div class="caja" id="caja">
        <h3>Ingresa los datos</h3>

        <form action="crear-registro" method="post" class="formulario">


            <div class="contenedor-inputs">

                <label for="nombreTipo">Ingresa el tipo de mueble:</label>
                <input type="text" placeholder="Tipo" name="tipo" id="nombreTipo" required onclick="limpiar()">
                <label for="precio">Ingresa el precio:</label>
                <input type="text" placeholder="Precio" name="precio" id="precio" required onclick="limpiarPrecio()">

            </div>
            <input type="button" class="bottom-regresar" value="Regresar" id="botonRegresar">
            <input type="submit" class="bottom-nav" value="Aceptar">
        </form>
        <label id="hecho" class="desactivado">successful!</label>
    </div>
</div>


<%--<p><%=request.getParameter("error")%></p>

<p>${error1}</p>--%>


    <script src="../jquery-3.6.0.min.js"></script>
    <script>

        function errorFuncion(){
            var error = "<%=request.getParameter("error")%>";
            var cadena = "${error1}";
            var cadenaNum = "${errorNum}";
            var hecho = "${hecho}";

            if (error != null && error==cadena){
                $('p').text(error);
                $('#nombreTipo').css({'background-color':'red'});
                $('#nombreTipo').attr('placeholder',"El mueble '"+error+"' ¡ya existe!");
            }else if (error != null && cadenaNum==error){
                $('#precio').css({'background-color':'red'});
                $('#precio').attr('placeholder',"La cadena '"+error+"' ¡No es un número!");
            }else if (hecho!=null && hecho==error){

                $('#hecho').attr('class','activado');
            }else {
                $('p').text("Mundo xD");
                $('#nombreTipo').css({'background-color':'white'});
                $('#precio').css({'background-color':'white'});
            }
        };
        document.addEventListener('DOMContentLoaded', errorFuncion);

        //$(document).load(errorFuncion);

        function limpiar(){
            $('#nombreTipo').css({'background-color':'white'});
            $('#nombreTipo').attr('placeholder',"Tipo");
            $('#hecho').attr('class','desactivado');
        };
        function limpiarPrecio(){
            $('#precio').css({'background-color':'white'});
            $('#precio').attr('placeholder',"Precio");
            $('#hecho').attr('class','desactivado');
        };

        $(document).ready(function (){
            $('#botonRegresar').click(function (){
                window.location = "<%= request.getContextPath()%>"+"/piezas";
            });
        });
    </script>


</body>
</html>
