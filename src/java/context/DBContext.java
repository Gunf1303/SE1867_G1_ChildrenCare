/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DBContext {
    public Connection connection;
    
    public DBContext() {
        try {
            //Change the username password and url to connect your own database
            String username = "sa";
            String password = "Tungld123@";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ChildrenCare";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Muon test thi bo comment
//    public static void main(String[] args) {
//        DBContext db = new DBContext();
//        System.out.println(db.connection);
//    }
}
