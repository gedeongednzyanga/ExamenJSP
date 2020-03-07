
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import view.consultation;


public class DAOConsultation implements Operations {

    Database bdd = new Database();
    @Override
    public void Insert(Object obj) {
       consultation c = (consultation) obj;
       Connection conn;
       PreparedStatement ps;
       String requte = ("CALL INSERT_UPDATE_DELETE_CONSULTATION (?,?,?,?,?,?,?,?,?,?)");
       
       try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requte);
           ps.setInt(1, c.getActionu());
           ps.setInt(2, c.getId());
           ps.setInt(3, c.getNumFiche());
           ps.setString(4, c.getAntencedant());
           ps.setDouble(5, c.getTaille());
           ps.setDouble(6, c.getPoids());
           ps.setDouble(7, c.getTension());
           ps.setDouble(8, c.getTemperature());
           ps.setDouble(9, c.getPerimetre());
           ps.setString(10, c.getSymptome());
           ps.executeQuery();
           
       }catch(SQLException e){
           
       }
    }

    @Override
    public List<consultation> Load() {
        List<consultation> donnee = new ArrayList<>();
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        String requete = "CALL SELECT_PATIENT_CONSULTE_LIMITE";
         try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
                donnee.add(new consultation(rs.getInt("idc"), rs.getString("antecedent"),
                        rs.getDouble("taille"), rs.getDouble("poids"), rs.getDouble("tension"),
                rs.getDouble("temperature"), rs.getDouble("perimetre"), rs.getString("symptome"),
                rs.getInt("idp"), rs.getString("nomp"), rs.getString("postnomp"), rs.getString("prenomp"),
                rs.getString("sexep"), rs.getString("naissancep"), rs.getInt("agep"), rs.getString("professionp"),
                rs.getString("motifp")));
            }
            conn.close();
       }catch(SQLException e){
           JOptionPane.showMessageDialog(null, e.getMessage());
       }
        return donnee; 
    }
    
    public List<consultation> ChargerConsul() {
        List<consultation> donnee = new ArrayList<>();
        Connection conn;
        PreparedStatement ps;
         ResultSet rs;
        String requete = "CALL SELECT_PATIENT_CONSULTE";
         try{
           conn = bdd.dbConnect();
           ps = conn.prepareStatement(requete);
           rs = ps.executeQuery();
           while(rs.next()){
                donnee.add(new consultation(rs.getInt("idc"), rs.getString("antecedent"),
                        rs.getDouble("taille"), rs.getDouble("poids"), rs.getDouble("tension"),
                rs.getDouble("temperature"), rs.getDouble("perimetre"), rs.getString("symptome"),
                rs.getInt("idp"), rs.getString("nomp"), rs.getString("postnomp"), rs.getString("prenomp"),
                rs.getString("sexep"), rs.getString("naissancep"), rs.getInt("agep"), rs.getString("professionp"),
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
