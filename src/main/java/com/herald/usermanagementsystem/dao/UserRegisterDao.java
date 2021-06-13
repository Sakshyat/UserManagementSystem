package com.herald.usermanagementsystem.dao;

import com.herald.usermanagementsystem.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sakshyat
 */
public class UserRegisterDao {

    public String registerUser(User user) {
        String first_name = user.getFirst_name();
        String last_name = user.getLast_name();
        String username = user.getUsername();
        String email = user.getEmail();
        String password = user.getPassword();
        String confirm_pass = user.getConfirm_pass();
        String phone = user.getPhone();

        Connection con;
        PreparedStatement ps;
        try {
            con = DBConnection.createConnection();
            //query to insert data into user table
            String query = "INSERT INTO user (id,first_name,last_name,username,email,password,confirm_pass,phone) VALUES (NULL,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);

            ps.setString(1, first_name);
            ps.setString(2, last_name);
            ps.setString(3, username);
            ps.setString(4, email);
            ps.setString(5, password);
            ps.setString(6, confirm_pass);
            ps.setString(7, phone);

            int i = ps.executeUpdate();

            if (i != 0) {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        //message to return in case of any failure
        return "Provide valid or unique details";
    }
}
