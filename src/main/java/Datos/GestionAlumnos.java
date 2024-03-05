package Datos;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;



public class GestionAlumnos {
        Conexion conexion;
        Connection con;
        public GestionAlumnos() throws ClassNotFoundException, SQLException{
            conexion = new Conexion();
            con = conexion.getCon();
        }
        public boolean insertarAlumno(String nombre, String apellidos, String curso, int nota, String direccion, int edad, String datosFamilia, boolean permisoFoto) {
            try {
                var pst = con.prepareStatement("insert into alumnos (nombre, apellido, curso, nota, direccion, edad, datosFamilia, permisoFoto) values (?,?,?,?,?,?,?,?)");
                pst.setString(1, nombre);
                pst.setString(2, apellidos);
                pst.setString(3, curso);
                pst.setInt(4, nota);
                pst.setString(5, direccion);
                pst.setInt(6, edad);
                pst.setString(7, datosFamilia);
                pst.setBoolean(8, permisoFoto);
                pst.executeUpdate();
                
                return true;
            } catch (SQLException ex) {
                return false;
            }
        }
        
        public boolean modificarAlumno(int id, String nombre, String apellidos, String curso, int nota, String direccion, int edad, String datosFamilia, boolean permisoFoto){
            try {
                var pst = con.prepareStatement("update alumnos set nombre = ?, apellido = ?, curso = ?, nota = ?, direccion = ?, edad = ?, datosFamilia = ?, permisoFoto=? where id = ?");
                pst.setString(1, nombre);
                pst.setString(2, apellidos);
                pst.setString(3, curso);
                pst.setInt(4, nota);
                pst.setString(5, direccion);
                pst.setInt(6, edad);
                pst.setString(7, datosFamilia);
                pst.setBoolean(8, permisoFoto);
                pst.setInt(9, id);
                pst.executeUpdate();
                
                return true;
            } catch (SQLException ex) {
                return false;
            }
        }
        
        public boolean eliminarAlumno(int id){
            try {
                var pst = con.prepareStatement("delete from alumnos where id=?");
                pst.setInt(1, id);
                pst.executeUpdate();
                return true;
            } catch (SQLException ex) {
                return false;
            }
        }
        
        public ArrayList<Alumno> obtenerAlumnos() throws SQLException{
            ArrayList<Alumno> alumnos = new ArrayList();
            var pst = con.prepareStatement("select * from alumnos");
            var rs = pst.executeQuery();
            while(rs.next()){
                alumnos.add(new Alumno(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("curso"), rs.getInt("nota"), rs.getString("direccion"), rs.getInt("edad"), rs.getString("datosFamilia"), rs.getBoolean("permisoFoto")));
            }
            return alumnos;
        }
        
        public Alumno obtenerAlumno(int id) throws SQLException{
            var pst = con.prepareStatement("select * from alumnos where id = ?");
            pst.setInt(1, id);
            var rs = pst.executeQuery();
            rs.next();
            return new Alumno(rs.getInt("id"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("curso"), rs.getInt("nota"), rs.getString("direccion"), rs.getInt("edad"), rs.getString("datosFamilia"), rs.getBoolean("permisoFoto"));
        }
}
