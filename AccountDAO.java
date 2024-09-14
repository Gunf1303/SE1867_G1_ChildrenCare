/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;



/**
 *
 * @author masoc
 */
import java.sql.*;

public class AccountDAO {
    public static boolean checkLogin(String username, String password){
        boolean isValid = false;
        try{
            // load driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // connect to MySQL Database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Admin","root","12345");
            String sql = "SELECT * FROM account WHERE username = ? AND password = ?";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            // run command
            ResultSet rs = pre.executeQuery();
            // If login correct
            if(rs.next()){
                isValid = true;
            }else {
                isValid = false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return isValid;
    }
}
