/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author toanm
 */
public class OrderDAO {

    public List<Order> getAllOrder(String userID) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT orderID, userID, date, total FROM dbo.tblOrder WHERE userID =  ORDER BY orderID DESC";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(query);
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int addOrder(String userID, int total) {
        String query = "INSERT INTO [dbo].[tblOrder] ([userID] ,[date] ,[total]) VALUES (? ,? ,?)";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int key = 0;
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(query);
            ptm.setString(1, userID);
            ptm.setDate(2, Date.valueOf(LocalDate.now()));
            ptm.setInt(3, total);
            ptm.executeUpdate();
            String sql2 = "select top 1 * from tblOrder order by orderID desc";
            ptm = conn.prepareStatement(sql2);
            ResultSet rs2 = ptm.executeQuery();
            while (rs2.next()) {
                key = rs2.getInt(1);
            }
        } catch (Exception e) {
        }
        return key;
    }

    public void addOrderDetail(String productID, String name, int price, String image, int quantity, int oid) {
        String query = "INSERT INTO [dbo].[tblOrderDetail] ([productID] ,[name] ,[price] ,[image] , [quantity],[orderID]) VALUES (? ,? ,? ,?,?,?)";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(query);
            ptm.setString(1, productID);
            ptm.setString(2, name);
            ptm.setInt(3, price);
            ptm.setString(4, image);
            ptm.setInt(5, quantity);
            ptm.setInt(6, oid);
            ptm.executeUpdate();

            String query2 = "update tblProduct set quantity = quantity - ? where productID = ?";
            ptm = conn.prepareStatement(query2);
            ptm.setInt(1, quantity);
            ptm.setString(2, productID);
            ptm.executeUpdate();
        } catch (Exception e) {
        }
    }


}
