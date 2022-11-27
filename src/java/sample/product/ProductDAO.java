/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author toanm
 */
public class ProductDAO {

    public List<Product> getListProduct() throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        String query = "SELECT productID, name, price, quantity, image, categoryID FROM tblProduct";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String categoryID = rs.getString("categoryID");
                    listProduct.add(new Product(productID, name, price, quantity, image, categoryID));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return listProduct;

    }

    public List<Product> getListProductSearch(String search) throws SQLException {
        List<Product> list = new ArrayList<>();
        String query = "SELECT productID, name, price, quantity, image, categoryID FROM tblProduct"
                + " WHERE name like ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String categoryID = rs.getString("categoryID");
                    list.add(new Product(productID, name, price, quantity, image, categoryID));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return list;

    }

    public double getTotalMoney(String pid) {
        String query = "SELECT SUM(price*quantity) FROM dbo.tblProduct WHERE productID = " + pid;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = new DBUtils().getConnection();
            ptm = conn.prepareStatement(query);
            rs = ptm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalProduct() {
        String query = "SELECT COUNT(*) FROM dbo.tblProduct";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                rs = ptm.executeQuery();
            }
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    private static final String DELETE = "DELETE tblProduct WHERE productID=?";

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean update(Product product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String query = "UPDATE tblProduct SET name=?, price=?, quantity=?, image=?, categoryID=? WHERE productID=?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(query);
                ptm.setString(1, product.getName());
                ptm.setInt(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getImage());
                ptm.setString(5, product.getCategoryID());
                ptm.setString(6, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    private static final String INSERT = "INSERT INTO tblProduct(productID, name, price, quantity, image, categoryID) VALUES(?,?,?,?,?,?)";

    public boolean insert(Product product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getName());
                ptm.setInt(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getImage());
                ptm.setString(6, product.getCategoryID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    private static final String CHECK_DUPLICATE = "SELECT productID FROM tblUsers WHERE productID=?";

    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
