/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Ashlyn
 */
@Entity
public class Card {
    @Id @Column private Integer cardID;
    private String att_color;
    private String att_shape;
    private String att_shade;
    private String att_number;
    
    public Integer getCardID() {
        return cardID;
    }

    public void setCardID(Integer cardID) {
        this.cardID = cardID;
    }

    public String getAtt_color() {
        return att_color;
    }

    public void setAtt_color(String att_color) {
        this.att_color = att_color;
    }

    public String getAtt_shape() {
        return att_shape;
    }

    public void setAtt_shape(String att_shape) {
        this.att_shape = att_shape;
    }

    public String getAtt_shade() {
        return att_shade;
    }

    public void setAtt_shade(String att_shade) {
        this.att_shade = att_shade;
    }

    public String getAtt_number() {
        return att_number;
    }

    public void setAtt_number(String att_number) {
        this.att_number = att_number;
    }

}
