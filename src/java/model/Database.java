
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Database {
    
    private String driver;
    private String url;
    private String user;
    private String pass;

    public Database() {
        this.driver = "com.mysql.jdbc.Driver";
        this.url = "jdbc:mysql://localhost:3306/ex_gest_hop";
        this.user = "root";
        this.pass ="";
    }
    
    public Connection dbConnect(){
        Connection conn =null;
        try{
            Class.forName(getDriver());
            conn = DriverManager.getConnection(getUrl(), getUser(), getPass());
            if (conn != null)
                System.out.println("Connected");
            else
                System.out.println("Impossible to connect");
        }catch(ClassNotFoundException | SQLException e){
            
        }
        return conn;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
