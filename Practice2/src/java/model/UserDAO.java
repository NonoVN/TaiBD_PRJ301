/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.persistence.EntityManager;
import utils.JPAUtils;

/**
 *
 * @author HOME
 */
public class UserDAO {
    public UserDAO(){
        
    }
    public UserDTO searchById(String userID){
        EntityManager em = JPAUtils.getEntityManager();
        try {
            UserDTO u = em.find(UserDTO.class,userID);
            return u;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
    
    public UserDTO login(String userID,String password){
        UserDTO u = searchById(userID);
        if(u!=null&&u.getPassword().equals(password)){
            return u;
        }else{
            return null;
        }
    }
}
