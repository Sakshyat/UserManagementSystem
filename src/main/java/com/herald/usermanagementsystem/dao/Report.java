package com.herald.usermanagementsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sakshyat
 */
public class Report {

    public void userReport(String username, String created_date) throws Exception {

        int res = 0;
        //query to insert into report table
        String sql = "INSERT INTO report(username, created_date) VALUES (?,?);";

        try {
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, created_date);

            System.out.println(ps);

            res = ps.executeUpdate();

        } catch (SQLException e) {
            throw e;
        }
        System.out.println(res);
    }

    public void deleteReport() throws ClassNotFoundException {
        try {
            //query to delete the data from the report table
            String sql = "DELETE FROM report";
            Connection con = DBConnection.createConnection();

            PreparedStatement ps = con.prepareStatement(sql);
            ps.execute();

        } catch (SQLException e) {
        }
    }
}
