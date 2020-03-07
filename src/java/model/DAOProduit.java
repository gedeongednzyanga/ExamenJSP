
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import view.produit;

public class DAOProduit implements Operations {
        Database db = new Database();
    @Override
    public void Insert(Object obj) {
        produit p = (produit) obj;
        Connection conn;
        PreparedStatement ps;
        String requete = "CALL INSERT_UPDATE_DELETE_ARTICLE(?,?,?,?,?,?)";
        try{
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            ps.setInt(1, p.getAction());
            ps.setInt(2, p.getIdp());
            ps.setString(3, p.getDesignation());
            ps.setDouble(4, p.getPvu());
            ps.setInt(5, p.getStockAlert());
            ps.setInt(6, p.getIdcat());
            ps.executeQuery();
        }catch(SQLException e){
            
        }
    }

    @Override
    public List<produit> Load() {
       List<produit> donnee = new ArrayList<>();
       Connection conn;
       PreparedStatement ps;
       ResultSet rs;
       
       String requete = "CALL SELECT_ARTICLE()";
     
       try{
           conn = db.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
               donnee.add(new produit(rs.getInt("codep"), rs.getString("designprod"), 
                       rs.getString("designation"), rs.getDouble("pus"), rs.getInt("stockAlerte")));
           }
           conn.close();
       }catch(SQLException e){
           
       }
        return donnee;
    }
    
    public List<produit> Load_Stock() {
       List<produit> donnee = new ArrayList<>();
       Connection conn;
       PreparedStatement ps;
       ResultSet rs;
       String requete = "CALL SELECT_STOCK()";
       try{
           conn = db.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
               donnee.add(new produit(rs.getInt("codep"), rs.getString("designprod"), 
                       rs.getString("designation"), rs.getDouble("pus"), rs.getInt("stockAlerte"), 
                       rs.getDouble("qtee"), rs.getString("expiration"), rs.getString("fabrication")));
           }
           conn.close();
       }catch(SQLException e){
           
       }
        return donnee;
    }
    @Override
    public List<produit> Search(String text) {
        List<produit> donnee = new ArrayList<>();
            Connection conn;
            PreparedStatement ps;
            ResultSet rs;
            String requete = "SELECT * FROM `get_article` WHERE designation LIKE '"+text+"'";
        try{
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            rs = ps.executeQuery();
            while(rs.next()){
                donnee.add(new produit(rs.getInt("codep"), rs.getString("designprod"), 
                        rs.getString("designation"), rs.getDouble("pus"), rs.getInt("stockAlerte"), 
                        rs.getDouble("qtee"), rs.getString("expiration"), rs.getString("fabrication")));
            }
            conn.close();
        }catch(SQLException e){

        }
         return donnee;
    }
    
    
}
