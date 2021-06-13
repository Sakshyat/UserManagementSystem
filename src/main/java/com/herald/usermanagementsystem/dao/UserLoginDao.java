package com.herald.usermanagementsystem.dao;

import com.herald.usermanagementsystem.model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Sakshyat
 */
public class UserLoginDao {

    public String loginUser(User user) {
        String username = user.getUsername();
        String password = user.getPassword();

        Connection con;
        Statement statement;
        ResultSet resultSet;

        String dbUsername;
        String dbPassword;
        String role;

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select userName,password,role from user");

            while (resultSet.next()) {
                dbUsername = resultSet.getString("username");
                dbPassword = resultSet.getString("password");
                role = resultSet.getString("role");

                //creating role based login conditions
                if (username.equals(dbUsername) && password.equals(dbPassword) && role.equals("Client")) {
                    return "is_client";
                } else if (username.equals(dbUsername) && password.equals(dbPassword) && role.equals("Admin")) {
                    return "is_admin";
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        //message to return in case of failure
        return "Invalid user credentials";
    }

}
