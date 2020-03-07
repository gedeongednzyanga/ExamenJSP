
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import view.examen;

public class DAOExamen implements Operations {

    Database bdd = new Database();
    
    @Override
    public void Insert(Object obj) {
        examen ex = (examen) obj;
        Connection conn;
        PreparedStatement ps;
        String requete = "CALL INSERT_UPDATE_DELETE_EXAMEN (?,?,?,?,?)";
        
        try{
            conn = bdd.dbConnect();
            ps = conn.prepareStatement(requete);
            ps.setInt(1, ex.getAction());
            ps.setInt(2, ex.getId());
            ps.setString(3, ex.getExamen());
            ps.setString(4, ex.getResultat());
            ps.setInt(5, ex.getConsult());
            ps.executeQuery();
        }catch(SQLException e){
            e.getMessage();
        }
    }

    @Override
    public List<?> Load() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public List<?> Search(String text) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
