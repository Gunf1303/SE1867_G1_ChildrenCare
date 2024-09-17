/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DAO;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Post;

/**
 *
 * @author Admin
 */
public class PostDAO extends DAO {

    public static void main(String[] args) {
        PostDAO postDAO = new PostDAO();
        List<Post> list= postDAO.getSortedPagedPostsByUserChoice(7, 6, "a", "Health");
        for (Post post : list) {
            System.out.println(post.getTitle());
        }
    }
    public List<Post> getAllPosts() {
        List<Post> postList = new ArrayList<>();
        xSql = "SELECT *  FROM [dbo].[Posts]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int postID = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String briefInfo = rs.getString(4);
                String thumbnail = rs.getString(5);
                int count = rs.getInt(6);
                int authorID = rs.getInt(7);
                int serviceID = rs.getInt(8);
                Date createdDate = rs.getDate(9);
                String categoryPost = rs.getString(10);
                Boolean statusPost = rs.getBoolean(11);
                Post post = new Post(postID, title, content, briefInfo, thumbnail, count, authorID, serviceID, createdDate, categoryPost, statusPost);
                postList.add(post);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postList;
    }


    public List<Post> getPostedPaged(int offSetPage, int numberOfPage) {
        List<Post> postList = new ArrayList<>();
        xSql = "SELECT *  FROM [dbo].[Posts]  "
                + "ORDER BY CreatedDate DESC "
                + "OFFSET ? ROWS \n "
                + "FETCH NEXT ? ROWS ONLY;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, offSetPage);
            ps.setInt(2, numberOfPage);

            rs = ps.executeQuery();
            while (rs.next()) {
                int postID = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String briefInfo = rs.getString(4);
                String thumbnail = rs.getString(5);
                int count = rs.getInt(6);
                int authorID = rs.getInt(7);
                int serviceID = rs.getInt(8);
                Date createdDate = rs.getDate(9);
                String categoryPost = rs.getString(10);
                Boolean statusPost = rs.getBoolean(11);
                Post post = new Post(postID, title, content, briefInfo, thumbnail, count, authorID, serviceID, createdDate, categoryPost, statusPost);
                postList.add(post);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postList;
    }

   
    
}
