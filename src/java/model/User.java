/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

//import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

//import java.util.List;
//import javax.json.Json;
//import javax.json.JsonObject;
//import javax.persistence.CascadeType;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.JoinTable;
//import javax.persistence.ManyToMany;
//import javax.persistence.NamedQueries;
//import javax.persistence.NamedQuery;
//import javax.persistence.Table;
//import javax.persistence.TableGenerator;
//import javax.validation.constraints.NotNull;
/**
 *
 * @author User
 */
@Entity
public class User {

    @Id
    private Integer userID;
    private String userName;
    private String email;
    private String password;

    public Integer getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

//@Entity
//
////@NamedQueries({
////    @NamedQuery(name = "User.CreateUser", query = "Insert into User u values u.userName= :userName, u.password = :password, u.email= : email")
////})
//public class User implements Serializable {
//
//    @TableGenerator(name = "user_gen", table = "id_gen", pkColumnName = "gen_name", valueColumnName = "gen_val", allocationSize = 100)
//    @Id
//    @GeneratedValue(strategy = GenerationType.TABLE, generator = "user-gen")
//    private int userId;
//    private String userName;
//    private String password;
//    private String email;
//
//    @ManyToMany(cascade = CascadeType.PERSIST)
//    @JoinTable(name = "gamelog", joinColumns = @JoinColumn(name = "userID"), inverseJoinColumns = @JoinColumn(name = "gameID"))
//    private List<Game> games;
//
//    public User(String username, String password) {
//        this.userName = username;
//        this.password = password;
//    }
//
//    public User() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    public Integer getUserId() {
//        return userId;
//    }
//
//    public void setUserId(int userId) {
//        this.userId = userId;
//    }
//
//    public List<Game> getGames() {
//        return games;
//    }
//
//    public void setGames(List<Game> games) {
//        this.games = games;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }
//
//    public String getUserName() {
//        return userName;
//    }
//
//    public void setUserName(String userName) {
//        this.userName = userName;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
////    public JsonObject toJson(){
////        return (Json.createObjectBuilder()
////                    .add("userId", userID)
////                    .add("userName", userName )
////                    .add("password", password)
////                    .add("email", email)
////                    .build());
////    }
//    @Override
//    public String toString() {
//        return "User{" + "userId=" + userId + ", userName=" + userName + ", password=" + password + ", email=" + email + '}';
//    }
//
//}
