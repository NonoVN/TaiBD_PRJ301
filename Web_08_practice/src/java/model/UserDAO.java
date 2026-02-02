/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DbUtils;

/**
 *
 * @author HOME
 */
public class UserDAO {

    public ArrayList<UserDTO> list = new ArrayList();

    public UserDAO() {
    }

    public UserDTO searchById(String username) {
        try {
            Connection conn = DbUtils.getConnection();
            String sql = "SELECT * FROM tblUser " + " WHERE userID=?";
            System.out.println(sql);
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            UserDTO u = null;
            while(rs.next()){
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullName");
                String password = rs.getString("password");
                String roleID = rs.getString("roleID");
                boolean status = rs.getBoolean("status");
                u = new UserDTO(userID,fullName,password,roleID,status);
            }
            return u;
        } catch (Exception e) {
            return null;
        }
    }   
    
    public UserDTO login(String username,String password)
    {
        UserDTO u = searchById(username);
        if(u!=null&&u.getPassword().equals(password)){
            return u;
        }
        return null;
    }
}    
