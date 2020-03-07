
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import view.utilisateur;

/**
 *
 * @author GEDEON
 */
public class DAOUtilisateur implements Operations {
    Database db = new Database();
    @Override
    public void Insert(Object obj) {
        utilisateur u = (utilisateur) obj;
        Connection conn;
        PreparedStatement ps;
        String requete = "CALL INSERT_UPDATE_DELETE_USER (?,?,?,?,?,?)";
        try{
            
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            ps.setInt(1, u.getAction());
            ps.setInt(2, u.getIdu());
            ps.setString(3, u.getNomUser());
            ps.setString(4, u.getMmotPasse());
            ps.setString(5, u.getTypeCompte());
            ps.setInt(6, u.getNiveauAcces());
            
            ps.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

    @Override
    public List<utilisateur> Load() {
         List<utilisateur> donnee = new ArrayList<>();
         Connection conn;
         PreparedStatement ps;
         ResultSet rs;
         String requete ="CALL SELECT_USER()";
         try{
             conn = db.dbConnect();
             ps = conn.prepareStatement(requete);
             rs = ps.executeQuery();
             while(rs.next()){
                donnee.add(new utilisateur(rs.getString("nom_user"), rs.getString("type_compte"),
                    rs.getString("pass_user"), rs.getInt("niveau_acces"), rs.getInt("id")));
             }
             conn.close();
         }catch(Exception ex){
             ex.printStackTrace();
         }
         return donnee;
    }

    @Override
    public List<?> Search(String text) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
