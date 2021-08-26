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
    <title>Title</title>
</head>
<body>
<h1 id="msgError"></h1>
    <h1 id = "h1"></h1>
<div class="wrapper" id="wrapper">
    <div class="cajaContenedora" id="cajaContenedora">
        <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup"><i class="fas fa-times"></i></a>
        <h3>Ingresa los datos</h3>

        <form action="crear-registro" method="post" id="formulario">
            <div class="contenedor-inputs">

                <input type="text" placeholder="Tipo" name="tipo" id="nombreTipo" required>
                <input type="text" placeholder="Precio" name="precio" id="precio" required>

            </div>
            <input type="submit" class="bottom-nav" value="Aceptar" id="boton">
        </form>
    </div>
</div>

<p><%=request.getParameter("error")%></p>

<p>${error1}</p>


    <script src="../jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function (){

            $("#boton").click(function (){
                if ($('#nombreTipo').html() ==0){
                    $.preventDefault();
                }
                    /*$("#h1").text("Hola Mundo");
                    $("#nombreTipo").css({'background-color':'red'});*/
            });


            $(document).load(function (){
                $('p').append('<h1>${error1} </h1>');
            });
            $(document).unload(function (){
                $('p').append('<h1>${error1} </h1>');
            });

        });

        /*var url = new URL("<%= request.getRequestURL()%>");
    var formulario = document.getElementById("formulario");


    function getAutorizacion(){
        if (formulario.tipo.value != 0 || formulario.precio.value != 0){

        }
/!*        var precio = document.getElementById("precio");
        url.searchParams.append('tipo',nomTipo);
        url.searchParams.append('tipo',precio);
        console.log("URL actual: "+url.href+"&");
        window.location = url;*!/
    }*/
    </script>


</body>
</html>
