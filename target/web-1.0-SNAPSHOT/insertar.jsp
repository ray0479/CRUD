<%-- 
    Document   : insertar
    Created on : 14 ene 2024, 3:52:07
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
            var action = request.getParameter("action");
        %>
        <div class="container">
            <form action="index.jsp" method="post">
                <input type="hidden" name="action" value="<%=action%>">
                <%if(action.equals("editar")){%>
                <input type="hidden" name="id" value="<%=request.getParameter("id")%>"><%}%>
                <div class="row">
                   <div class="col-12">
                       <h1 class="text-center"><%if(action.equals("insertar")){%> <%="Insertar Alumno"%> <%}else{%><%="Editar Alumno"%><%}%></h1>
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
                   <select class="form-select" aria-label="Default select example" name="nota">
                        <option selected>Open this select menu</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                   </select>
               </div>
               <div class="mb-3">
                   <label for="datosFamilia" class="form-label">Datos de la Familia</label>
                   <textarea class="form-control" name="datosFamilia" rows="3"></textarea>
               </div>
                <input class="form-check-input" type="checkbox" value="concedido" name="foto">
                <label class="form-check-label" for="flexCheckDefault">Consentimiento para uso de foto</label>
                <br/><br/><br/>
               <div class="row">
                   <div class="col-12">
                       <%
                           if(action.equals("insertar")){
                       %>
                            <input type="submit" class="btn btn-success btn-lg col-12" value="Insertar" />
                       <%}
                           else{
                                   
                        %>
                             <input type="submit" class="btn btn-warning btn-lg col-12" value="Editar" />
                       <%}%>
                   </div>
               </div>
               
            </form>
        </div>
                
    </body>
</html>
