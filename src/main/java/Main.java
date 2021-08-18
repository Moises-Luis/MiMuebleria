import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    private static final String USER = "root2";
    private static final String PASSWORD = "313346631";
    private static String URL_MYSQL = "jdbc:mysql://localhost:3306/mi_muebleria";

    public static void main(String[] args) {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL_MYSQL,USER,PASSWORD);
            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT INTO proveedor VALUES (6,'proveedor6', 365548)");
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
