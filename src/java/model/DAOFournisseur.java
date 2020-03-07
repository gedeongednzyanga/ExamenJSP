
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import view.fournisseur;

public class DAOFournisseur implements Operations {

    Database db = new Database();
    @Override
    public void Insert(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<?> Load() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public List<fournisseur> Get_Fournisseur() {
       List<fournisseur> donnee = new ArrayList<>();
       Connection conn;
       PreparedStatement ps;
       ResultSet rs;
       String requete = "CALL SELECT_FOURNISSEUR()";
       
       try{
           conn = db.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while (rs.next()){
               donnee.add(new fournisseur(rs.getInt("id"), rs.getString("nom")+" "+
                       rs.getString("postnom")+" "+rs.getString("prenom")));
           }
           conn.close();
       }catch(SQLException e){
           
       }
       return donnee;
    }
    @Override
    public List<?> Search(String text) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
