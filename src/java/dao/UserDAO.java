/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.annotation.Resource;
import javax.persistence.Entity;
import javax.sql.DataSource;
import model.User;

/**
 *
 * @author User
 */

public class UserDAO implements Serializable{
    
    @Resource(name = "jdbc/team02_puzzlegame")
    private DataSource ds;
    
    public void AddUser(User user){
        String sql = "Insert into User Values('"+ user.getUserName() +"','"+ user.getEmail() + "', '"+ user.getPassword()+"')";
        modifyQuery(sql);
    }
    
    public void modifyQuery(String qry){
        try {
            Connection con = ds.getConnection();
            con.createStatement().execute(qry);
            con.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
     public ResultSet executeQuery(String qry){
         ResultSet rs = null;
        try {
            Connection con = ds.getConnection();
            rs = con.createStatement().executeQuery(qry);
            con.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rs;
     }
}
