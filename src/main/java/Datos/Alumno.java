package Datos;


public class Alumno {
        String nombre, apellidos, curso, direccion,datosFamilia;
    int id, nota, edad;
    boolean permisoFoto;

    public Alumno(int id, String nombre, String apellidos, String curso, int nota, String direccion, int edad, String datosFamilia, boolean permisoFoto) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curso = curso;
        this.direccion = direccion;
        this.datosFamilia = datosFamilia;
        this.nota = nota;
        this.edad = edad;
        this.permisoFoto = permisoFoto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDatosFamilia() {
        return datosFamilia;
    }

    public void setDatosFamilia(String datosFamilia) {
        this.datosFamilia = datosFamilia;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public boolean isPermisoFoto() {
        return permisoFoto;
    }

    public void setPermisoFoto(boolean permisoFoto) {
        this.permisoFoto = permisoFoto;
    }
    
}
