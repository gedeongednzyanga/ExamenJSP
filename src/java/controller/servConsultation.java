
package controller;

import model.DAOConsultation;
import view.consultation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GEDEON
 */
public class servConsultation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           DAOConsultation consultation = new DAOConsultation();
           consultation c = new consultation();
           RequestDispatcher rd = null;
           try{
               if(request.getParameter("btn") != null){
                   c.setActionu(Integer.parseInt(request.getParameter("action")));
                   c.setId(Integer.parseInt(request.getParameter("id")));
                   c.setNumFiche(Integer.parseInt(request.getParameter("numfiche")));
                   c.setAntencedant(request.getParameter("antecedent"));
                   c.setTaille(Double.parseDouble(request.getParameter("taille")));
                   c.setPoids(Double.parseDouble(request.getParameter("poids")));
                   c.setTension(Double.parseDouble(request.getParameter("tension")));
                   c.setTemperature(Double.parseDouble(request.getParameter("temperature")));
                   c.setPerimetre(Double.parseDouble(request.getParameter("perimetre")));
                   c.setSymptome(request.getParameter("symptome"));
                   consultation.Insert(c);
               }
               rd = request.getRequestDispatcher("consultation.jsp");
           }catch(Exception e){
               
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
