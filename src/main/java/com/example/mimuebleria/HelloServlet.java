package com.example.mimuebleria;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/piezas")

public class HelloServlet extends HttpServlet {

    ArrayList<PiezaPOJO> tipoPieza = new ArrayList<PiezaPOJO>();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*HttpSession sesion;*/
        int ordenarPor = 0;

           String cadenaDeVariable = request.getParameter("ordenar_por");
            request.setAttribute("msgError",cadenaDeVariable);
            try {
                System.out.println("Lo intento XD");
                if (request.getParameter("ordenar_por")== null){
                    ordenarPor=0;
                }else {
                    ordenarPor = Integer.parseInt(request.getParameter("ordenar_por"));
                }
                    if (ordenarPor==0 || ordenarPor==1 || ordenarPor==2){
                        System.out.println("---------------------------------'''''''''???????---------");
                        DBCalculator dBTipo = new DBCalculator();
                        tipoPieza = dBTipo.getTabla(ordenarPor);
                        int valor = tipoPieza.size();
                        /*request.setAttribute("tipoDePieza", tipoPieza);*/
                        request.getSession().setAttribute("tipoDePieza", tipoPieza);
                        request.setAttribute("i", valor);
                        request.setAttribute("rayos", ordenarPor);

                        request.getRequestDispatcher("fabrica/pieza.jsp").include(request,response);

                    }else {
                        System.out.println("Error numero muy grande :V");
                        request.getRequestDispatcher("fabrica/Error.jsp").include(request,response);
                    }

            }catch (NumberFormatException numFormat){
                System.out.println("Primera exception: "+numFormat);
                request.getRequestDispatcher("fabrica/Error.jsp").include(request,response);
            }
    }

    public void destroy() {
    }
}