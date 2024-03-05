<%-- 
    Document   : formulario.jsp
    Created on : 10 ene 2024, 13:00:34
    Author     : rayco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.GestionAlumnos" %>
<%@page import="Datos.Alumno" %>
<%@page import="Conexion.Conexion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
        %>
        <div class="container">
            <form action="editar.jsp" method="post">
                <input type="hidden" value="<%=id%>" name="id"/>
                <div class="row">
                   <div class="col-12">
                       <h1 class="text-center">Editar Alumno</h1>
                   </div>
               </div>
               <div class="mb-3">
                   <label for="name" class="form-label">Nombre del Alumno</label>
                   <input type="text" class="form-control" name="name">
               </div>
               <div class="mb-3">
                   <label for="lastName" class="form-label">Apellidos del Alumno</label>
                   <input type="text" class="form-control" name="lastName">
               </div>
               <div class="mb-3">
                   <label for="edad" class="form-label">Edad del Alumno</label>
                   <input type="text" class="form-control" name="edad">
               </div>
               <div class="mb-3">
                   <label for="direccion" class="form-label">Direccion Alumno</label>
                   <input type="text" class="form-control" name="direccion">
               </div>
               <div class="mb-3">
                   <label for="curso" class="form-label">Curso del Alumno</label>
                   <input type="text" class="form-control" name="curso">
               </div>
                <div class="mb-3">
                   <label for="nota" class="form-label">Nota del Alumno</label>
                   <input type="text" class="form-control" name="nota">
               </div>
               <div class="mb-3">
                   <label for="datosFamilia" class="form-label">Datos de la Familia</label>
                   <textarea class="form-control" name="datosFamilia" rows="3"></textarea>
               </div>
                <input class="form-check-input" type="checkbox" value="concedido" name="foto">
                <label class="form-check-label" for="flexCheckDefault">Consentimiento para uso de foto</label>
               <div class="row">
                   <div class="col-12">
                       <input type="submit" class="btn btn-warning btn-lg col-12" value="Editar" />
                   </div>
               </div>   
            </form>
            
            <%
                
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String nombre = request.getParameter("name");
                    String apellidos = request.getParameter("lastName");
                    int edad = Integer.parseInt(request.getParameter("edad"));
                    String direccion = request.getParameter("direccion");
                    String curso = request.getParameter("curso");
                    int nota = Integer.parseInt(request.getParameter("nota"));
                    String datosFamilia = request.getParameter("datosFamilia");
                    boolean permisoFoto = "concedido".equals(request.getParameter("foto"));
                    GestionAlumnos gestion = new GestionAlumnos();
                    gestion.modificarAlumno(id, nombre, apellidos, curso, nota, direccion, edad, datosFamilia, permisoFoto);
                    response.sendRedirect("index.jsp");
                }
            %>
        </div>
    </body>
</html>
