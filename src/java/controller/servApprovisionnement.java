
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOApprovisionnement;
import view.approvisionnement;

/**
 *
 * @author GEDEON
 */
public class servApprovisionnement extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           DAOApprovisionnement approv = new DAOApprovisionnement();
           approvisionnement a = new approvisionnement();
           RequestDispatcher rd= null;
           
           try{
               if(request.getParameter("btn") != null){
                   a.setAction(Integer.parseInt(request.getParameter("action")));
                   a.setId(Integer.parseInt(request.getParameter("id")));
                   a.setQuantite(Integer.parseInt(request.getParameter("quantite")));
                   a.setPua(Double.parseDouble(request.getParameter("pua")));
                   a.setFabrication(request.getParameter("fabication"));
                   a.setExpiration(request.getParameter("expiration"));
                   a.setIdp(Integer.parseInt(request.getParameter("produit")));
                   a.setFournisseur(Integer.parseInt(request.getParameter("fournisseur")));
                   approv.Insert(a);
               }
               rd = request.getRequestDispatcher("approvisionnement.jsp");
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
    }// </editor-fold>

}
