package com.herald.usermanagementsystem.model;

/**
 *
 * @author Sakshyat
 */
public class User {
    int id;
    String first_name,last_name,username,email,password,confirm_pass,phone,role;

    //constructors
    public User() {
    }
     
    public User(int id) {
        this.id = id;
    }
    
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String first_name, String last_name, String username, String email, String password, String confirm_pass, String phone) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.confirm_pass = confirm_pass;
        this.phone = phone;
    }

    //getters and setters
    public int getId() {
        return id;
    }
   
    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getConfirm_pass() {
        return confirm_pass;
    }

    public String getPhone() {
        return phone;
    }
    
    public String getRole(){
        return role;
    }

    public void setFirst_name(String first_Name) {
        this.first_name=first_Name;
    }

    public void setLast_name(String last_Name) {
        this.last_name=last_Name;
    }

    public void setEmail(String email) {
       this.email=email;
    }

    public void setUsername(String username) {
       this.username=username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setConfirm_pass(String confirm_pass) {
        this.confirm_pass = confirm_pass;
    }
   
    public void setPhone(String phone) {
        this.phone=phone;
    }

    public void setRole(String role) {
       this.role=role;
    }

    public void setId(int id) {
        this.id=id;
    }
    
    
}