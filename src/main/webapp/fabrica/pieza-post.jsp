<%--
  Created by IntelliJ IDEA.
  User: benjamin
  Date: 21/08/21
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.mimuebleria.Archivar" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<jsp:useBean id="litaFinal" class="com.example.mimuebleria.HelloServlet"/>
<jsp:setProperty name="litaFinal" property="*"/>


<%
/*    Archivar archivar = new Archivar();
    archivar.setTipo(request.getParameter("tipo"));
    archivar.setPrecio(Integer.valueOf(request.getParameter("precio")));*/
%>
<html>
<head>
    <title>Pieza-post</title>
</head>
<body>

    <%--<h1>Datos procesados de pieza.jsp </h1>
    <h2><%=request.getParameter("tipo")%></h2>
    <h2><%=request.getParameter("precio")%></h2>--%

    <%--@elvariable id="pieza" type="com.example.mimuebleria.DBCalculator"--%>
    <c:forEach var="pieza"  begin="0" end="2">
        <%--<c:out value="${tipoPieza.miLista.get(0).tipo}"/>
        <c:out value="${tipoPieza.miLista.get(0).cantidad}"/>
        <c:out value="${tipoPieza.miLista.get(0).precio}"/>--%>
            <%--<p>${pieza.precio}</p>
            <p>${pieza.tipo}</p>--%>
        <p>${tipoDePieza.get(pieza).tipo}</p>
       <%-- <p>${tipoDePieza.get(0).precio}</p>
        <p>${tipoDePieza.get(0).cantidad}</p>
        <p>${tipoDePieza.get(1).tipo}</p>
        <p>${tipoDePieza.get(1).precio}</p>
        <p>${tipoDePieza.get(1).cantidad}</p>--%>
        </c:forEach>

</body>
</html>
