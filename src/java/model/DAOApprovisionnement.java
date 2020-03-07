
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import view.approvisionnement;


public class DAOApprovisionnement implements Operations {
    
    Database db = new Database();
    @Override
    public void Insert(Object obj) {
        approvisionnement a = (approvisionnement) obj;
        Connection conn;
        PreparedStatement ps;
        
        String requete = "CALL INSERT_UPDATE_DELETE_APPROV(?,?,?,?,?,?,?,?)";
        try{
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            ps.setInt(1, a.getAction());
            ps.setInt(2, a.getId());
            ps.setInt(3, a.getQuantite());
            ps.setDouble(4, a.getPua());
            ps.setString(5, a.getFabrication());
            ps.setString(6, a.getExpiration());
            ps.setInt(7, a.getIdp());
            ps.setInt(8, a.getFournisseur());
            ps.executeQuery();
        }catch(SQLException e){
            
        }
    }

    @Override
    public List<approvisionnement> Load() {
       List<approvisionnement> donnee = new ArrayList<>();
       Connection conn;
       PreparedStatement ps;
       ResultSet rs;
       String requete = "CALL SELECT_APPROV()";
       try{
           conn = db.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
               donnee.add(new approvisionnement(rs.getInt("idap"),rs.getString("designation"),rs.getInt("qtea"),
                       rs.getString("dapprov"),
                       rs.getString("nom")+" "+rs.getString("postnom"),
                       rs.getDouble("pua"), rs.getString("expiration"), rs.getString("fabrication"),
                        rs.getString("typep")));
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
