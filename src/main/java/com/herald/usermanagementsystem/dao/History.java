package com.herald.usermanagementsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sakshyat
 */
public class History {

    public void userHistory(String username, String activity, String date) throws Exception {

        int res = 0;
        //query to insert into history table
        String sql = "INSERT INTO history(username, activity, date) VALUES (?,?,?);";

        try {
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, activity);
            ps.setString(3, date);

            System.out.println(ps);

            res = ps.executeUpdate();

        } catch (SQLException e) {
            throw e;
        }
        System.out.println(res);
    }
}
