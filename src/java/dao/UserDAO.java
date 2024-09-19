/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.User;
import context.DAO;
/**
 *
 * @author pc
 */
public class UserDAO extends DAO {

    public User getUserByID(int userID) {

        xSql = "select * from [dbo].[Users] where UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBoolean(10), rs.getDate(11));
                return user;
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws ParseException {
        UserDAO userDAO = new UserDAO();
//        List<User> users = userDAO.getAllUsersByAdmin(1, 10, "Email", "", "", "", "", "", 2);
//        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
//        java.util.Date utilDate = dateFormat.parse("10-26-2023");
//        Date startDate = new Date(utilDate.getTime());
//        utilDate = dateFormat.parse("01-01-2023");
//        Date endDate = new Date(utilDate.getTime());
//        System.out.println(userDAO.getUserCountByCreatedDate(startDate, endDate));

//        List<User> users = userDAO.search("", "", "UserID", "asc", 1);
//        for (User user : users) {
//            System.out.println(user.getEmail());
//        }
//        System.out.println(userDAO.countTotalUserByAdmin("", "", "", "", "", 3));
//        
    }
}
