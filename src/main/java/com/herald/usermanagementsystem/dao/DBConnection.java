package com.herald.usermanagementsystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Sakshyat
 */
public class DBConnection {

    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/users"; //mysql url with db name
        String username = "root"; //mysql username
        String password = ""; //mysql password

        try {

            Class.forName("com.mysql.jdbc.Driver");  //mysql driver loading

            con = DriverManager.getConnection(url, username, password);  //creating connection with mysql
            System.out.println("Printing connection object " + con);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return con;
    }

}
