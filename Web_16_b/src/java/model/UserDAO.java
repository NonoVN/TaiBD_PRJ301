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
import javax.persistence.EntityManager;
import utils.JPAUtils;
/**
 *
 * @author HOME
 */
public class UserDAO {
    
    public UserDAO(){
    }
    
    public UserDTO searchById(String username){
        EntityManager em = JPAUtils.getEntityManager();
        try{
            return em.find(UserDTO.class,username);
        }
        catch (Exception E){
            return null;
        }finally{
            if(em!=null && em.isOpen()){
                em.close();
            }
        }
    }
    
    public UserDTO login(String username,String password){
        UserDTO u = searchById(username);
        if(u!=null && u.getPassword().equals(password)){
            return u;
        }
        return null;
    }
}
