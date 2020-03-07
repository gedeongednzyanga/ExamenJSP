
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.DAOUtilisateur;
import view.utilisateur;

/**
 *
 * @author GEDEON
 */
//@WebServlet ("/FileUploadServlet")
//@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
//        maxFileSize = 1024 * 1024 * 10,
//        maxRequestSize = 1024 * 1024 * 50)


public class servUtilisateur extends HttpServlet {

    private String ExtractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
            if (s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            DAOUtilisateur utilisateur = new DAOUtilisateur();
            utilisateur u = new utilisateur();
            RequestDispatcher rd = null;

            try{
                if(request.getParameter("btn") != null){
                    
                    u.setAction(Integer.parseInt(request.getParameter("action")));
                    u.setIdu(Integer.parseInt(request.getParameter("id")));
                    u.setNomUser(request.getParameter("nomuser"));
                    u.setMmotPasse(request.getParameter("pass"));
                    u.setTypeCompte(request.getParameter("typecompte"));
                    u.setNiveauAcces(Integer.parseInt(request.getParameter("niveau")));
                    
                    utilisateur.Insert(u);
                }
                rd = request.getRequestDispatcher("configuration.jsp");
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
    }// </editor-fold>

}
