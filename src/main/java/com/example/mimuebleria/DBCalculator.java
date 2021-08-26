package com.example.mimuebleria;

import java.sql.*;
import java.util.ArrayList;

public class DBCalculator {
    private static final String USER = "root2";
    private static final String PASSWORD = "313346631";
    private static String URL_MYSQL = "jdbc:mysql://localhost:3306/mi_muebleria";
    Connection connection = null;
    ResultSet resultSet;

    public ArrayList getTabla(int ordenarPor) {
/*        int id = 7;
        String nombre = "Proveedor7";*/
        ArrayList<PiezaPOJO> listaTipoPieza= new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            //PreparedStatement select = connection.prepareStatement("SELECT * FROM pieza");

            Statement query = connection.createStatement();

            if (ordenarPor == 0) {
            resultSet = query.executeQuery("SELECT tipo, cantidad, precio FROM pieza");
            }else if (ordenarPor == 1) {
             resultSet = query.executeQuery("SELECT tipo, cantidad, precio FROM pieza ORDER BY cantidad DESC");
            }else if (ordenarPor == 2) {
             resultSet= query.executeQuery("SELECT tipo, cantidad, precio FROM pieza ORDER BY cantidad ASC");
            }

            while (resultSet.next()){
                PiezaPOJO tipoPieza = new PiezaPOJO();
                tipoPieza.setTipo(resultSet.getString("tipo"));
                tipoPieza.setCantidad(resultSet.getInt("cantidad"));
                tipoPieza.setPrecio(resultSet.getFloat("precio"));
                listaTipoPieza.add(tipoPieza);
                /*
                System.out.println("Id = "+resultSet.getString("id")+" nombre = "+ resultSet.getString("nombre")+
                        " telefono = "+resultSet.getString("telefono"));
                */
            }
            //Statement statement = connection.createStatement();
            //statement.executeUpdate("INSERT INTO proveedor VALUES ("+id+",'"+nombre+"',45659)");
            //statement.executeUpdate("DELETE FROM proveedor WHERE id=0");

            /*

            */

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return listaTipoPieza;
    }


    public void setRegistro(RecordPiezaNueva recordPieza) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);
            PreparedStatement insert = connection.prepareStatement("INSERT INTO pieza (tipo, cantidad, precio, id_fabrica) VALUES(?,?,?,?)");
            insert.setString(1,recordPieza.getTipo());
            insert.setInt(2,recordPieza.getCantidad());
            insert.setFloat(3,recordPieza.getPrecio());
            insert.setInt(4,recordPieza.getIdFabrica());

            insert.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();

        }finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public boolean getLlaveRepetida(String cadena) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL_MYSQL, USER, PASSWORD);

            Statement query = connection.createStatement();
            resultSet = query.executeQuery("SELECT tipo FROM pieza");

            while (resultSet.next()){
                if (resultSet.getString("tipo").trim().equalsIgnoreCase(cadena.trim())){
                    return true;
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
}
