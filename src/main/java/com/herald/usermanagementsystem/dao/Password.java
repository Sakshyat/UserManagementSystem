package com.herald.usermanagementsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author asus
 */
public class Password {

    public void passwordEmailSender(String email, String randompassword) throws AddressException {

        String to = email;
        String from = "inferno.ums@gmail.com";  //sender email
        String host = "smtp.gmail.com";         //gmail smtp

        Properties properties = System.getProperties();

        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("inferno.ums@gmail.com", "herald54321");
            }
        });

        session.setDebug(true);

        try {
            // Default Mimemessage object creation
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Password reset code");

            message.setText("Dear user,\n \nYour new password is: " + randompassword + "\nFor security reasons, it is recommended to change your password immediately after logging in. \n \nThank You.");

            Transport.send(message);

        } catch (MessagingException e) {
            System.out.println(e);
        }
    }

    public void ChangePassword(String email, String password) throws ClassNotFoundException, SQLException {

        try {
            Connection con = DBConnection.createConnection();
            //query to update the password after code has been sent to the email
            String sql = "Update user set password=?, confirm_pass=? where  email=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, password);
            ps.setString(2, password);
            ps.setString(3, email);

            ps.executeUpdate();

        } catch (SQLException e) {

            throw e;

        }

    }
}
