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

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.TableGenerator;

@Entity
public class Game {

    @TableGenerator(name = "game_gen", allocationSize = 1, pkColumnName = "gen_name", valueColumnName = "gen_val", table = "id_gen")
    @Id
    @GeneratedValue(generator = "game_gen", strategy = GenerationType.TABLE)
    private int gameID;
    private String level;

    @ManyToMany(mappedBy = "users", cascade = CascadeType.PERSIST)
    private List<User> users;

    @Override
    public String toString() {
        return "Game{" + "gameID=" + gameID + ", level=" + level + ", users=" + users + '}';
    }

    public int getGameID() {
        return gameID;
    }

    public void setGameID(int gameID) {
        this.gameID = gameID;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

}

