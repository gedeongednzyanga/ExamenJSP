
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import view.patient;

public class DAOPatient implements Operations {

    Database bdd = new Database();
    
    
    @Override
    public void Insert(Object obj) {
       patient p = (patient) obj;
       Connection conn;
       PreparedStatement ps;
      
       String requete = "CALL INSERT_UPDATE_DELETE_PATIENT(?,?,?,?,?,?,?,?,?,?)";
       try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requete);
           ps.setInt(1, p.getAction());
           ps.setInt(2, p.getId());
           ps.setString(3, p.getNom());
           ps.setString(4, p.getPostnom());
           ps.setString(5, p.getPrenom());
           ps.setString(6, p.getSexe());
           ps.setString(7, p.getDatenaiss());
           ps.setInt(8, p.getAge());
           ps.setString(9, p.getProfession());
           ps.setString(10, p.getMotif());
           ps.executeQuery();
           
       }catch(SQLException e){
           
       }
    }

    @Override
    public List<patient> Load() {
        
        List<patient> donnee = new ArrayList<>();
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        String requete = "CALL SELECT_ALL_PATIENT";
        
        try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
                donnee.add(new patient(rs.getInt("idp"), rs.getString("nomp"),
                        rs.getString("postnomp"), rs.getString("prenomp"), rs.getString("sexep"),
                rs.getString("naissancep"), rs.getInt("agep"), rs.getString("professionp"),
                rs.getString("motifp")));
            }
            conn.close();
       }catch(SQLException e){
           JOptionPane.showMessageDialog(null, e.getMessage());
       }
        return donnee; 
    }
    public List<patient> LoadSearchDate(String rechercheDate) {
        
        List<patient> donnee = new ArrayList<>();
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        String requete = "SELECT * FROM `get_all_patient` WHERE date_arrive LIKE '%"+rechercheDate+"%'";
        
        try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
                donnee.add(new patient(rs.getInt("idp"), rs.getString("nomp"),
                        rs.getString("postnomp"), rs.getString("prenomp"), rs.getString("sexep"),
                rs.getString("naissancep"), rs.getInt("agep"), rs.getString("professionp"),
                rs.getString("motifp")));
            }
            conn.close();
       }catch(SQLException e){
           JOptionPane.showMessageDialog(null, e.getMessage());
       }
        return donnee; 
    }
    
    public List<patient> LoadSearchFiltre(String recherche) {
        
        List<patient> donnee = new ArrayList<>();
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        String requete = "SELECT * FROM get_all_patient WHERE date_arrive LIKE '%"+recherche+"%'";
        
        try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
                donnee.add(new patient(rs.getInt("idp"), rs.getString("nomp"),
                        rs.getString("postnomp"), rs.getString("prenomp"), rs.getString("sexep"),
                rs.getString("naissancep"), rs.getInt("agep"), rs.getString("professionp"),
                rs.getString("motifp")));
            }
            conn.close();
       }catch(SQLException e){
           JOptionPane.showMessageDialog(null, e.getMessage());
       }
        return donnee; 
    }
    @Override
    public List<?> Search(String text) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
