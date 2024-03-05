package Datos;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.SQLException;

public class GestionAdmins {
    Conexion conexion;
    Connection con;
    public GestionAdmins() throws ClassNotFoundException, SQLException{
        conexion = new Conexion();
        con = conexion.getCon();
    }
    
    public int comprobarContraseña(String nombre, String pass) throws SQLException{
        int id = -1;
        var pst = con.prepareStatement("select * from admin");
        var rs = pst.executeQuery();
        
        while(rs.next()){
            if(rs.getString("nombre").equals(nombre) && rs.getString(3).equals(pass)){
                id = rs.getInt("id");
            }
        }
        return id;
    }
    public boolean comprobarId(int id) throws SQLException{
        boolean exists = false;
        var pst = con.prepareStatement("select * from admin");
        var rs = pst.executeQuery();
        while(rs.next()){
            exists = ((int) rs.getInt("id")) == id;
            if(exists) break;
        }
        
        return exists;
    }
}
