<%-- 
    Document   : index
    Created on : 10 ene 2024, 12:59:52
    Author     : rayco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.GestionAlumnos" %>
<%@page import="Datos.Alumno" %>
<%@page import="Conexion.Conexion" %>
<%@page import="Datos.GestionAdmins" %>
<%@page import="java.util.ArrayList" %>
<%
    GestionAlumnos gestion = new GestionAlumnos();
    GestionAdmins ga = new GestionAdmins();
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Gestion Alumnos IES El Rincon</title>
    </head>
    <body>
        <%
            String action = request.getParameter("action");
            HttpSession sesion = request.getSession(true);
            var sesionId = sesion.getAttribute("id");
            
            int id = 0;
            String nombre = "";
            String apellidos = "";
            int edad = 0;
            String direccion = "";
            String curso = "";
            int nota = 0;
            String datosFamilia = "";
            boolean permisoFoto = false;
            
            if(action != null){
                switch(action){
                    case "insertar":
                        nombre = request.getParameter("name");
                        apellidos = request.getParameter("lastName");
                        edad = Integer.parseInt(request.getParameter("edad"));
                        direccion = request.getParameter("direccion");
                        curso = request.getParameter("curso");
                        nota = Integer.parseInt(request.getParameter("nota"));
                        datosFamilia = request.getParameter("datosFamilia");
                        permisoFoto = "concedido".equals(request.getParameter("foto"));
                        gestion.insertarAlumno(nombre, apellidos, curso, nota, direccion, edad, datosFamilia, permisoFoto);
                        break;
                    case "editar":
                        id = Integer.parseInt(request.getParameter("id"));
                        nombre = request.getParameter("name");
                        apellidos = request.getParameter("lastName");
                        edad = Integer.parseInt(request.getParameter("edad"));
                        direccion = request.getParameter("direccion");
                        curso = request.getParameter("curso");
                        nota = Integer.parseInt(request.getParameter("nota"));
                        datosFamilia = request.getParameter("datosFamilia");
                        permisoFoto = "concedido".equals(request.getParameter("foto"));
                        gestion.modificarAlumno(id, nombre, apellidos, curso, nota, direccion, edad, datosFamilia, permisoFoto);
                        break;
                    case "eliminar":
                        id = Integer.parseInt(request.getParameter("id"));
                        gestion.eliminarAlumno(id);
                        break;
                    case "login":
                        int idAdmin = ga.comprobarContraseña(request.getParameter("name"), request.getParameter("pass"));
                        if(idAdmin != -1){
                            sesion.setAttribute("id", idAdmin);
                        }else response.sendRedirect("login.jsp");
                        break;
                    case "logout":
                        sesion.invalidate();
                        response.sendRedirect("index.jsp");
                        break;
                }
            }
            /*if(null == sesionId){
                response.sendRedirect("login.jsp");
            }else{
                if(!ga.comprobarId((int)sesionId)) response.sendRedirect("login.jsp");
            }*/
            
        %>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="text-center">Gestion Alumnos IES El Rincon</h1>
                    <a href="index.jsp?action=logout">LogOut</a>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <% 
                        ArrayList<Alumno> alumnos = gestion.obtenerAlumnos();
                    %>
                    <table class="table table-striped">
                        <thead>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Curso</th>
                            <th>Nota Global</th>
                            <th>Direccion</th>
                            <th>Edad</th>
                            <th>Datos de la familia</th>
                            <th>Foto</th>
                        </thead>
                        <tbody>
                            <%
                                for(Alumno alumno : alumnos){
                                int idAlumno = alumno.getId();
                            %>
                            <tr>
                                <td><%=idAlumno%></td>
                                <td><%=alumno.getNombre()%></td>
                                <td><%=alumno.getApellidos()%></td>
                                <td><%=alumno.getCurso()%></td>
                                <%
                                    if(alumno.getNota() < 5){
                                        %>
                                        <td>Suspendido</td>
                                <%        
                                    }
                                    else if(alumno.getNota()>=5 && alumno.getNota() <8){
                                    %>
                                        <td>Aprobado</td>
                                    <%        
                                    }
                                    else if(alumno.getNota()>=8 && alumno.getNota() <10){
                                    %>
                                    <td>Notable</td>
                                    <%        
                                    }
                                    else if(alumno.getNota()==10){
                                    %>
                                    <td>Sobresaliente</td>
                                    <% }%>
                                <td><%=alumno.getDireccion()%></td>
                                <td><%=alumno.getEdad()%></td>
                                <td><%=alumno.getDatosFamilia()%></td>
                                <td><input class="form-check-input" type="checkbox" id="flexCheckDefault" disabled <%if(alumno.isPermisoFoto()){%> <%="checked"%> <%}%>></td>
                                <td>
                                    <form action="insertar.jsp" method="post">
                                        <input type="hidden" name="action" value="editar">
                                        <input type="hidden" name="id" value="<%=idAlumno%>">
                                        <input type="submit" value="Editar" class="btn btn-warning">
                                    </form>
                                </td>
                                <td>
                                    <form action="index.jsp" method="post">
                                        <input type="hidden" name="action" value="eliminar">
                                        <input type="hidden" name="id" value="<%=idAlumno%>">
                                        <input type="submit" value="Eliminar" class="btn btn-danger">
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                            
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <form action="insertar.jsp" method="post">
                        <input type="hidden" name="action" value="insertar">
                        <input type="submit" value="Insertar" class="btn btn-success btn-lg col-12">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
