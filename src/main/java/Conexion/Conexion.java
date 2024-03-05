package Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    Connection con;
    public Conexion() throws ClassNotFoundException, SQLException{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost/aed", "openpg", "openpgpwd");
    }

    public Connection getCon() {
        return this.con;
    }
}
