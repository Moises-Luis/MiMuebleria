package com.example.mimuebleria;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CrearRegistro", value = "/fabrica/crear-registro")
public class CrearRegistro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if(request.getParameter("tipo")== null || request.getParameter("precio")==null){
                request.getRequestDispatcher("fabrica/pieza.jsp").include(request,response);
            }else {
                String tipoMueble = request.getParameter("tipo");
                float precio = Float.parseFloat(request.getParameter("precio"));

                    RecordPiezaNueva nuevaPieza = new RecordPiezaNueva();
                    nuevaPieza.setTipo(tipoMueble);
                    nuevaPieza.setCantidad(4);
                    nuevaPieza.setPrecio(precio);
                    nuevaPieza.setIdFabrica(1);

                    DBCalculator bdPieza = new DBCalculator();
                    int tamaño = bdPieza.getTabla(1).size();
                    boolean error = false;
                if (bdPieza.getLlaveRepetida(tipoMueble) == false){
                    bdPieza.setRegistro(nuevaPieza);
                    request.getSession().setAttribute("errorBooleano",error);
                    request.getRequestDispatcher("fabrica/pieza.jsp").include(request,response);
                }else {
                    error=true;
                    request.getSession().setAttribute("error1",tipoMueble);
                    request.getSession().setAttribute("i",tamaño);
                    request.getSession().setAttribute("errorBooleano",error);
                    request.setAttribute("error2",tipoMueble);
                    //request.getRequestDispatcher("AgregarRegistro.jsp?error="+tipoMueble).forward(request,response);
                    response.sendRedirect(request.getContextPath()+"/piezas?error="+tipoMueble);
                }

            }
        }catch (Exception e){
            System.out.println("----------------------ZZZZZZZZZZZZZZZZZ--------------------");
            System.out.println("Excepcinó :V----->"+e);
            System.out.println("----------------------ZZZZZZZZZZZZZZZZZ--------------------");
            //response.sendRedirect("/MiMuebleria_war_exploded/fabrica/AgregarRegistro.jsp");
            //request.getRequestDispatcher("/piezas").include(request,response);

            //response.sendRedirect("piezas?errorPrecio=true&errorTipo=true");
            //response.sendRedirect("/MiMuebleria_war_exploded/fabrica/AgregarRegistro.jsp");
        }
    }

}
