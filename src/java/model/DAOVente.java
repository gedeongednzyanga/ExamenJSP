/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import view.sortie;
import view.utilisateur;

/**
 *
 * @author GEDEON
 */
public class DAOVente {
    Database db = new Database();
    Connection conn;
    
    public void Insert(Object obj) {
        sortie v = (sortie) obj;
        Connection conn;
        PreparedStatement ps;
        String requete = "CALL INSERT_UPDATE_DELETE_VENTE (?,?,?,?)";
        try{
            
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            ps.setInt(1, v.getActionu());
            ps.setInt(2, v.getIdsort());
            ps.setInt(3, v.getIdclient());
            ps.setInt(4, v.getIdart());
          
            ps.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void InsertD(Object obj) {
        sortie v = (sortie) obj;
        Connection conn;
        PreparedStatement ps;
        String requete = "CALL INSERT_UPDATE_DETAIL_VENTE (?,?,?,?,?,?)";
        try{
            
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            ps.setInt(1, v.getActionu());
            ps.setInt(2, v.getIdd());
            ps.setInt(3, v.getIdart());
            ps.setFloat(4, v.getPvu());
            ps.setInt(5, v.getQtev());
            ps.setInt(6, v.getIdsort());
            ps.executeQuery();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public List<sortie> Load() {
         List<sortie> donnee = new ArrayList<>();
         Connection conn;
         PreparedStatement ps;
         ResultSet rs;
         String requete ="SELECT * FROM `get_client_vente`  ORDER by id DESC LIMIT 0,1";
         try{
             conn = db.dbConnect();
             ps = conn.prepareStatement(requete);
             rs = ps.executeQuery();
             while(rs.next()){
                donnee.add(new sortie(rs.getInt("id"), rs.getInt("idClient"),
                    rs.getString("nomp")+" "+rs.getString("postnomp")+" "+rs.getString("prenomp"),
                    rs.getString("dateVente")));
             }
             conn.close();
         }catch(Exception ex){
             ex.printStackTrace();
         }
         return donnee;
    }
    public List<sortie> LoadF(int idv) {
         List<sortie> donnee = new ArrayList<>();
         Connection conn;
         PreparedStatement ps;
         ResultSet rs;
         String requete ="SELECT * FROM `get_detail_vente` WHERE idVente ="+idv+"";
         try{
             conn = db.dbConnect();
             ps = conn.prepareStatement(requete);
             rs = ps.executeQuery();
             while(rs.next()){
                donnee.add(new sortie(rs.getInt("idVente"), rs.getInt("idArticle"),
                    rs.getInt("id"), rs.getFloat("pv"), rs.getInt("qte"), rs.getString("designation"),
                rs.getFloat("ptotal")));
             }
             conn.close();
         }catch(Exception ex){
             ex.printStackTrace();
         }
         return donnee;
    }
}
