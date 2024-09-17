/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

/**
 *
 * @author Nhin Nhin
 */
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO extends DBContext {
  public Connection con = null;
  public PreparedStatement ps = null;
  public ResultSet rs = null;
  public String xSql = null;

  public DAO() {
     con = connection;
  }
  public void finalize() {
     try {
        if(con != null) con.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
  }
    
}

