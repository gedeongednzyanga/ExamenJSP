
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOExamen;
import view.examen;

/**
 *
 * @author GEDEON
 */
public class servExamen extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            DAOExamen examen = new DAOExamen();
            examen e = new examen();
            RequestDispatcher rd= null;
            
            try{
                if(request.getParameter("btn") != null){
                    e.setAction(Integer.parseInt(request.getParameter("action")));
                    e.setId(Integer.parseInt(request.getParameter("id")));
                    e.setExamen(request.getParameter("examen"));
                    e.setResultat(request.getParameter("resultat"));
                    e.setConsult(Integer.parseInt(request.getParameter("consult")));
                    examen.Insert(e);
                }
                rd = request.getRequestDispatcher("laboConsulte.jsp");
            }catch(NumberFormatException ex){
                
            }
            rd.forward(request, response);
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
