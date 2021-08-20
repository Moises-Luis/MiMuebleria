<%@ page import="java.awt.geom.Area" %><%--
  Created by IntelliJ IDEA.
  User: benjamin
  Date: 19/08/21
  Time: 05:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>fabrica</title>
    <link rel="stylesheet" href="css/fabrica.css">
</head>

<body>
    <h3 id="sub"></h3>
    <h3 id="sub2"></h3>
    <h4 id="sub3"></h4>
    <h5 id="sub4"></h5>
    <p id="linkPagina"></p>
    <p id="codigos"></p>
    <%!
    String titulo = "";
    String titulos[] = {"Usuarios","Libro","Piezas","Tipo de mueble","Ensamble de Piezas","Ensamble de mueble","Muebles"};
    %>
    <h1> Area de Fabrica</h1>

   <section class="main">

       <div class="grilla">
           <%
               for (int i = 0; i<7; i++){ %>

           <div id="cuadro<%=i+1%>" class="cuadro">
               <div class="imagen">
                   <img src="../imagenes/raton<%=i+1%>.png" alt="imagen relacionada al boton">
               </div>

                   <h2><%=titulos[i]%></h2>

           </div>
           <%
               }
           %>
       </div>


   </section>

    <script src="../jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        $<%! String x = ""; %>

        $(document).text(function (){
            $('.cuadro').click(function (){
                /*$("#cuadro1").attr("class","cambio");
                $("#cuadro1").attr("stylesheet","css/fabrica.css");*/

                $(this).hide(2000).show(1000);
                /*$("#sub").text("<%= request.getRequestURL().toString()%>" );
                $("#sub2").text("<%= request.getRequestURI()%>" );
                $("#sub3").text("<%= request.getServletPath()%>" );
                $("#sub4").text("<%= request.getContextPath()%>" );
                $("#linkPagina").html(window.location.pathname);*/
                window.location.pathname = "<%= request.getContextPath()%>"+"/fabrica/pieza.jsp";



            });
        });
    </script>


</body>
</html>
