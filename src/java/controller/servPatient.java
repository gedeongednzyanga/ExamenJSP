
package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOPatient;
import view.patient;

/**
 *
 * @author GEDEON
 */



public class servPatient extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           DAOPatient patient = new DAOPatient();
           patient p = new patient();
           RequestDispatcher rd = null;
           
           try{
               if(request.getParameter("btn") != null){
                   p.setAction(Integer.parseInt(request.getParameter("action")));
                   p.setId(Integer.parseInt(request.getParameter("id")));
                   p.setNom(request.getParameter("nom"));
                   p.setPostnom(request.getParameter("postnom"));
                   p.setPrenom(request.getParameter("prenom"));
                   p.setSexe(request.getParameter("sexe"));
                   p.setDatenaiss(request.getParameter("datenaiss"));
                   p.setAge(Integer.parseInt(request.getParameter("age")));
                   p.setProfession(request.getParameter("profession"));
                   p.setMotif(request.getParameter("motif"));
                   patient.Insert(p);
               }
               rd = request.getRequestDispatcher("identificationp.jsp");
           }catch(Exception e){
              e.printStackTrace();
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
