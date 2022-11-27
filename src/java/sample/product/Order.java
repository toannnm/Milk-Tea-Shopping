/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Date;

/**
 *
 * @author toanm
 */
public class Order {

    private String orderID;
    private String userID;
    Date d;
    private int total;

    public Order() {
    }

    public Order(String orderID, String userID, Date d, int total) {
        this.orderID = orderID;
        this.userID = userID;
        this.d = d;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getD() {
        return d;
    }

    public void setD(Date d) {
        this.d = d;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", userID=" + userID + ", d=" + d + ", total=" + total + '}';
    }

}
