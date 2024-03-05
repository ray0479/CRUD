package servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class server extends HttpServlet{

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");
//        var out = resp.getWriter();
//        out.println("que pasaaaaaa!!!!");
//        out.close();
//    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Obtener el parámetro "nombre" del formulario
        String nombre = request.getParameter("nombre");

        
        request.setAttribute("nombre", nombre);
        RequestDispatcher dispatcher = request.getRequestDispatcher("prueba.jsp");
        dispatcher.forward(request, response);
//        response.sendRedirect("prueba.jsp");
       
    }
    
}
