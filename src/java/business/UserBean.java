/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.User;

/**
 *
 * @author Ashlyn
 */

@Stateless
public class UserBean {
    
    @PersistenceContext(unitName="PuzzleGamePU") private EntityManager em;

    public User createUser(String userName, String email, String password) {
        
        
        User user = new User();
        user.setUserName(userName);
        user.setEmail(email);
        user.setPassword(password);
        em.persist(user);
        return(user);
    }
}
