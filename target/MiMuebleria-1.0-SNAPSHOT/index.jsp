<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="css/index.css">
</head>

<body>

<h1>Login</h1>

<section class="cuadro">
    <div class="grilla">
        <img src="imagenes/mueble2.jpeg" alt="muebles" class="imagen">
        

        <div class="formulario">
            <form action="" method="">
                <label for="nombre">Ingrese su nombre de usuario</label>
                <input type="text" placeholder="Nombre de usuario" name="usuario" id="nombre">
                <label for="contraseña">Ingrese su contraseña</label>
                <input type="password" placeholder="Contraseña" name="contraseña" id="contraseña">
                <input type="submit" value="Ingresar" id="ingresar">
            </form>
        </div>
    </div>
</section>

<%--

<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>

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
--%>

</body>
</html>