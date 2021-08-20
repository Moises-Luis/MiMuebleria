<%--
  Created by IntelliJ IDEA.
  User: benjamin
  Date: 19/08/21
  Time: 08:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    
    <title>pieza</title>
    <link rel="stylesheet" href="css/pieza.css">
</head>
<body>

    <header>
        <div>
            <img src="../imagenes/raton1.png" alt="logo de raton" width="100">
        </div>
        <nav>
            <ul>
                <li>INICIO</li>
                <li>CREAR REGISTRO</li>
                <li>ELIMINAR REGISTRO</li>
                <li>MODIFICAR REGISTRO</li>
            </ul>
        </nav>

    </header>

    <h1>Piezas</h1>

    <form class="form-ordenar" action="">
        <label class="sub-titulo">Ordenar por cantidad existente:</label>
        <br>
        <label class="mayor-menor" for="mayor-menor">Mayor-menor &nbsp;&nbsp; </label>
        <input type="radio" name="seleccion" value="mayor-menor" id="mayor-menor">
        <br/>
        <label class="menor-mayor" for="menor-mayor">Menor-mayor &nbsp;&nbsp; </label>
        <input type="radio" name="seleccion" value="menor-mayor" id="menor-mayor">
    </form>

    <section class="wrapper">
        <article class="tabla">
            <table>
                <tr>
                    <td>Tipo</td>
                    <td>Precio</td>
                    <td>Cantidad Disponible</td>
                </tr>
                <tr>
                    <td>Pata cuadrada</td>
                    <td>5</td>
                    <td>10435345345345345345345345</td>
                </tr>
            </table>
        </article>

        <article class="edicion">
            <form action="" class="form-edicion">
                <label class="titulo-edicion">Editar:</label>
                <input type="button" value="Crear Registro">
                <input type="button" value="Eliminar Registro">
                <input type="button" value="Modificar Registro">
            </form>
        </article>

    </section>

    <script src="../jquery-3.6.0.min.js"></script>
    <script>
        $(document).text(function (){
            $("input").click(function (){
                var a = $('input[type = "radio"]:checked');

                if ($('#mayor-menor').checked()){
                    $('#menor-mayor').disable();
                }else{
                     $("#mayor-menor").disable();
                }
            });
        });
    </script>

</body>
</html>
