<%@ page import="com.example.mimuebleria.PiezaPOJO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mimuebleria.HelloServlet" %>
<%@ page import="java.beans.PropertyEditorSupport" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: benjamin
  Date: 19/08/21
  Time: 08:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="atributo" class="com.example.mimuebleria.PiezaPOJO"/>
<jsp:setProperty name="atributo" property="*"/>

<%--<jsp:useBean id="lista" class="com.example.mimuebleria.ListaTipoPieza"/>
<jsp:setProperty name="lista" property="*"/>--%>

<%
    HttpSession session1 = request.getSession(false);
    ArrayList<PiezaPOJO> listaC = (ArrayList<PiezaPOJO>)session1.getAttribute("miListaXD");
%>
<html>
<head>
    
    <title>pieza</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pieza.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">

</head>
<body>
    <%!
        boolean errorTipo = true;//
        boolean errorPrecio = true;//
        boolean auxBorrarBoolean;
    %>
    <%
        if (request.getParameter("errorPrecio")!= null){
            System.out.println(request.getParameter("errorPrecio"));
            errorPrecio = true;
        }if (request.getParameter("errorTipo") != null){
        System.out.println(request.getParameter("errorTipo"));
        errorTipo=true;
        }

    %>
    <header>
        <div class="caja-logo">
            <img class="logo" src="${pageContext.request.contextPath}/imagenes/raton1.png" alt="logo de raton" width="100">
        </div>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/fabrica/fabrica.jsp">INICIO</a></li>
                <li><a href="fabrica/crear-registro" id="crear-registro">CREAR REGISTRO</a></li>
                <li><a href="fabrica/eliminar-registro">ELIMINAR REGISTRO</a></li>
                <li><a href="fabrica/editar-registro">MODIFICAR REGISTRO</a></li>
            </ul>
        </nav>

    </header>

    <section class="wrapper">
        <section class="articles">

            <h1>Piezas</h1>

            <article class="tabla">

                <br/>
                    <table class="miTabla">
                        <tr>
                            <td>Tipo</td>
                            <td>Precio</td>
                            <td>Cantidad Disponible</td>
                        </tr>

                        <%--@elvariable id="pieza" type="com.example.mimuebleria.DBCalculator"--%>

                        <c:forEach var="pieza"  begin="0" end="${i-1}">
                            <tr>
                            <td><p>${tipoDePieza.get(pieza).tipo}</p></td>
                            <td><p>${tipoDePieza.get(pieza).precio}</p></td>
                            <td><p>${tipoDePieza.get(pieza).cantidad}</p></td>
                            </tr>
                        </c:forEach>
                        
                        <%--
                        <c:forEach var="i" begin="1" end="3">
                            <tr>
                                <c:if test="${listC.get(0) != null}">
                                <td><%=listaC.get(0).getPrecio()%> </td>
                                <td><%=listaC.get(0).getCantidad()%></td>
                                <td><%=listaC.get(0).getTipo()%></td>
                            </c:if>
                             &lt;%&ndash;   <%
                                    i++;
                                %>&ndash;%&gt;
                               &lt;%&ndash; <td>${atributo.tipo}</td>
                                <td>${atributo.precio}</td>
                                <td>${atributo.cantidad}</td>&ndash;%&gt;
                            </tr>
                        </c:forEach>--%>

             <%--   /*
                System.out.println("Id = "+resultSet.getString("id")+" nombre = "+ resultSet.getString("nombre")+
                        " telefono = "+resultSet.getString("telefono"));
                */--%>
                          <%--  }
                            %>--%>
                    </table>
            </article>

        </section>

        <%--Parte lateral 'Ordenar por cantidad Existente'--%>
        <aside>
            <form class="form-ordenar" name="form-ordenar" action="">
                <label class="sub-titulo">Ordenar por cantidad existente:</label>
                <br>
                <label class="ninguno" for="ninguno">Predeterminado &nbsp;&nbsp; </label>
                <input type="radio" name="seleccion" value="ninguno" id="ninguno"  onclick="getPredeterminado()"
                <c:if test="${rayos==0}">checked</c:if> >
                <br>
                <label class="mayor-menor" for="mayor-menor">Mayor-menor &nbsp;&nbsp; </label>
                <input type="radio" name="seleccion" value="mayor-menor" id="mayor-menor" onclick="getMayorMenor()" <c:if test="${rayos==1}">checked</c:if>>
                <br/>
                <label class="menor-mayor" for="menor-mayor">Menor-mayor &nbsp;&nbsp; </label>
                <input type="radio" name="seleccion" value="menor-mayor" id="menor-mayor" onclick="getMenorMayor()" <c:if test="${rayos==2}">checked</c:if>>
            </form>
        </aside>
    </section>


    <%-------parte oculta-------%>
    <%--class=<%=nombreClase1%>--%>
<%--    <div <c:if test="${errorBooleano==false || errorBooleano==false}"> class="overlay" </c:if> <c:if test="${errorBooleano=='true'}"> class="overlay active" </c:if>  id="overlay">
        <div <c:if test="${errorBooleano==false || errorBooleano==false}"> class="popup" </c:if> <c:if test="${errorBooleano=='true'}"> class="popup active" </c:if> id="popup">
            <a href="#" onclick="cerrar();" id="btn-cerrar-popup" class="btn-cerrar-popup"><i class="fas fa-times" ></i></a>
            <h3>Ingresa los datos</h3>

            <form action="fabrica/crear-registro" method="post">
                <div class="contenedor-inputs">

                    <input type="text" placeholder="Tipo" name="tipo" required>
                    <input type="text" placeholder="Precio" name="precio" required>

                </div>
                <input type="submit" class="btn-submit" value="Aceptar">
            </form>
        </div>
    </div>

<%
    if(request.getParameter("error") == null ){
        request.getSession().removeAttribute("errorBooleano");
    }
%>--%>

    <script src="${pageContext.request.contextPath}/fabrica/js/pieza.js"></script>
    <script src="${pageContext.request.contextPath}/jquery-3.6.0.min.js"></script>
    <script>
        var url = new URL("<%= request.getRequestURL()%>");
        function dale(){
            alert("Hola!!!")
        }
        function getMayorMenor(){
            document.getElementById('mayor-menor').setAttribute("checked",true);
            url.searchParams.append('ordenar_por','1');
            console.log("URL actual: "+url.href);
            window.location = url;
        }

        function getMenorMayor(){
            this.checked=true;
            url.searchParams.append('ordenar_por','2');
            console.log("URL actual: "+url.href);
            window.location = url;
        }

        function getPredeterminado(){
            this.checked=true;
             url.searchParams.append('ordenar_por','0');
            console.log("URL actual: "+url.href);
            window.location = url;

        }
    </script>

</body>
</html>
<%--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--%>
<%--
${pageContext.request.contextPath}
--%>