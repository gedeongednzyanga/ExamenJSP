
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOProduit;
import view.produit;

/**
 *
 * @author GEDEON
 */
public class servProduit extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            DAOProduit produit = new DAOProduit();
            produit p = new produit();
            RequestDispatcher rd =null;
            String colonne, ligne;
            
            try{
                if(request.getParameter("btn") != null){
                    p.setAction(Integer.parseInt(request.getParameter("action")));
                    p.setIdp(Integer.parseInt(request.getParameter("id")));
                    p.setDesignation(request.getParameter("produit"));
                    p.setPvu(Double.parseDouble(request.getParameter("pvu")));
                    p.setStockAlert(Integer.parseInt(request.getParameter("alert")));
                    p.setIdcat(Integer.parseInt(request.getParameter("catego")));
                    produit.Insert(p);
                }else if(request.getParameter("btnSearch") != null){
                    colonne = request.getParameter("colone");
                    ligne = request.getParameter("ligne");
                    produit.Search( ligne);
                   
                }
                rd = request.getRequestDispatcher("medicament.jsp");
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
