package com.herald.usermanagementsystem.dao;

import com.herald.usermanagementsystem.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sakshyat
 */
public class UserCrud {

    public static void addUser(User user) throws Exception {

        try {
            Connection con = DBConnection.createConnection();
            //query to insert data to the user table
            String sql = "INSERT INTO USER (first_name, last_name, username, email, password, confirm_pass, phone, role) VALUES (?,?,?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFirst_name());
            ps.setString(2, user.getLast_name());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getConfirm_pass());
            ps.setString(7, user.getPhone());
            ps.setString(8, user.getRole());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw e;
        }

    }

    public void delete(String username) throws ClassNotFoundException {
        try {
            //query to delete data from user table
            String sql = "DELETE FROM USER WHERE username = ?";
            Connection con = DBConnection.createConnection();

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.execute();

        } catch (SQLException e) {
        }
    }
}
