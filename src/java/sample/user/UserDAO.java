/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

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
public class UserDAO {

    private static final String LOGIN = "SELECT userID, name, phone, address, email, roleID FROM tblUsers "
            + "WHERE userID=? AND password=?";
    private static final String SEARCH = "SELECT userID, name, phone, address, email, roleID FROM tblUsers "
            + "WHERE name like ?";
    private static final String UPDATE = "UPDATE tblUsers SET [name]=?, phone=?, [address]=?, email=?, roleID=? WHERE userID=?";
    

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, name, "**", phone, address, email, roleID);
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
        return user;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    listUser.add(new UserDTO(userID, name, password, phone, address, email, roleID));
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
        return listUser;

    }

    public List<UserDTO> getAllUser() throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        String sql = "SELECT userID, name, phone, address, email, roleID FROM tblUsers";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");
                    String password = "***";
                    listUser.add(new UserDTO(userID, name, password, phone, address, email, roleID));
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
        return listUser;

    }

    public int getTotalUser() {
        String query = "SELECT COUNT(*) FROM dbo.tblUsers";
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

    
}
