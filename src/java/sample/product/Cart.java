/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author toanm
 */
public class Cart {

    private Map<String, OrderDetail> cart;

    public Cart() {
    }

    public Map<String, OrderDetail> getCart() {
        return cart;
    }

    public void setCart(Map<String, OrderDetail> cart) {
        this.cart = cart;
    }

    public boolean add(OrderDetail orderDetail) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(orderDetail.getProductID())) {
            int currentQuantity = this.cart.get(orderDetail.getProductID()).getQuantity();
            orderDetail.setQuantity(currentQuantity + orderDetail.getQuantity());
        }
        this.cart.put(orderDetail.getProductID(), orderDetail);
        check = true;
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }

    public boolean update(String id, OrderDetail orderDetail) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, orderDetail);
                check = true;
            }
        }
        return check;
    }

    public int getTotal() {
        int x = 0;
        for (Map.Entry<String, OrderDetail> entry : cart.entrySet()) {
            String key = entry.getKey();
            OrderDetail value = entry.getValue();
            x += value.getPrice();
        }
        return x;
    }

    public void updateOrderDetail(int oid) {
        for (Map.Entry<String, OrderDetail> entry : cart.entrySet()) {
            String key = entry.getKey();
            OrderDetail value = entry.getValue();
            OrderDAO dao = new OrderDAO();
            dao.addOrderDetail(value.getProductID(),value.getName(), value.getPrice(), value.getImage(), value.getQuantity(),oid);
        }
    }

}
