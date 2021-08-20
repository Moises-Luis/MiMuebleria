import java.sql.*;

public class Main {
    private static final String USER = "root2";
    private static final String PASSWORD = "313346631";
    private static String URL_MYSQL = "jdbc:mysql://localhost:3306/mi_muebleria";

    public static void main(String[] args) {
        int id = 7;
        String nombre = "Proveedor7";

        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL_MYSQL,USER,PASSWORD);
            //Statement statement = connection.createStatement();
            //statement.executeUpdate("INSERT INTO proveedor VALUES ("+id+",'"+nombre+"',45659)");
            //statement.executeUpdate("DELETE FROM proveedor WHERE id=0");

            /*
            Statement query= connection.createStatement();
            ResultSet resultSet = query.executeQuery("SELECT * FROM proveedor");
            while (resultSet.next()){
                System.out.println("Id = "+resultSet.getString("id")+" nombre = "+ resultSet.getString("nombre")+
                        " telefono = "+resultSet.getString("telefono"));
            }
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

    }
}
