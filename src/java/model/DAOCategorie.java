
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import view.produit;

public class DAOCategorie implements Operations {
    
    Database db = new Database();
    @Override
    public void Insert(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<produit> Load() {
        List<produit> donnee = new ArrayList<>();
        Connection conn ;
        PreparedStatement ps;
        ResultSet rs;
        String requete = "CALL SELECT_TYPE()";
        try{
            conn = db.dbConnect();
            ps = conn.prepareStatement(requete);
            rs = ps.executeQuery();
            while(rs.next()){
                donnee.add(new produit(rs.getString("designation"),rs.getInt("id")));
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
