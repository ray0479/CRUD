<%-- 
    Document   : login
    Created on : 22 ene 2024, 9:34:59
    Author     : rayco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form action="index.jsp" method="post">
                <input type="hidden" name="action" value="login"/>
                <div class="row">
                   <div class="col-12">
                       <h1 class="text-center">Login</h1>
                   </div>
               </div>
               <div class="mb-3">
                   <label for="name" class="form-label">Nombre</label>
                   <input type="text" class="form-control" name="name">
               </div>
                <div class="mb-3">
                   <label for="pass" class="form-label">contraseña</label>
                   <input type="text" class="form-control" name="pass">
               </div>
               <div class="row">
                   <div class="col-12">
                       <input type="submit" class="btn btn-primary btn-lg col-12" value="LogIn" />
                   </div>
               </div>
            </form>
        </div>
    </body>
</html>
