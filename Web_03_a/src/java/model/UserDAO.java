/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author HOME
 */
public class UserDAO {
    public ArrayList<UserDTO> list = new ArrayList<>();
    public UserDAO(){
        list = new ArrayList<>();
        list.add(new UserDTO("admin","admin","Nguyen Van Da"));
        list.add(new UserDTO("user1","user1","Bui Van C"));
    }
    public UserDTO SearchById(String username){
        for(UserDTO userDTO : list){
            if(userDTO.getUsername().equalsIgnoreCase(username))
                return userDTO;
        }
        return null;
    }
    
    public UserDTO Login(String username,String password){
        UserDTO u = SearchById(username);
        if(u!=null&&u.getPassword().equals(password)){
            return u;
        }
        return null;
    }
}
