/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author HOME
 */
public class JPAUtils {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("Practice2PU");
    public static final EntityManager getEntityManager(){
        return emf.createEntityManager();
    }
}
