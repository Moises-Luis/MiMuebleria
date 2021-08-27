package com.example.mimuebleria;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CrearRegistro", value = "/fabrica/crear-registro")
public class CrearRegistro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/fabrica/AgregarRegistro.jsp").include(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            if(request.getParameter("tipo")== null || request.getParameter("precio")==null){
                request.getRequestDispatcher("/fabrica/piezas").include(request,response);
            }else {

                String tipoMueble = request.getParameter("tipo").trim();
                String cadenaPrecio = request.getParameter("precio").trim();
                float precio=0;

                try {
                    precio = Float.parseFloat(request.getParameter("precio"));
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
                        request.getSession().setAttribute("hecho", "successful!");
                        //request.getSession().setAttribute("errorBooleano",error);
                        //request.getRequestDispatcher("crear-registro?error=¡successful!").include(request,response);
                        response.sendRedirect(request.getContextPath()+"/fabrica/crear-registro?error=successful!");
                    }else {
                        error=true;
                        request.getSession().setAttribute("error1",tipoMueble);
                        request.getSession().setAttribute("i",tamaño);
                        request.getSession().setAttribute("errorBooleano",error);
                        request.setAttribute("error2",tipoMueble);
                        //request.getRequestDispatcher("AgregarRegistro.jsp?error="+tipoMueble).forward(request,response);
                        response.sendRedirect(request.getContextPath()+"/fabrica/crear-registro?error="+tipoMueble);
                    }
                }catch (NumberFormatException e){
                    request.getSession().setAttribute("errorNum", cadenaPrecio);
                    response.sendRedirect(request.getContextPath()+"/fabrica/crear-registro?error="+cadenaPrecio);
                }

            }
        }catch (Exception e){

            System.out.println("----------------------ZZZZZZZZZZZZZZZZZ--------------------");
            System.out.println("Excepcinó :V----->"+e);
            System.out.println("----------------------ZZZZZZZZZZZZZZZZZ--------------------");
            response.sendRedirect(request.getContextPath()+"/fabrica/crear-registro");
            //response.sendRedirect("/MiMuebleria_war_exploded/fabrica/AgregarRegistro.jsp");
            //request.getRequestDispatcher("/piezas").include(request,response);

            //response.sendRedirect("piezas?errorPrecio=true&errorTipo=true");
            //response.sendRedirect("/MiMuebleria_war_exploded/fabrica/AgregarRegistro.jsp");
        }
    }

}
