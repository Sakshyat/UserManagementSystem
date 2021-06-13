/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.herald.usermanagementsystem.test;

import com.herald.usermanagementsystem.dao.UserLoginDao;
import com.herald.usermanagementsystem.model.User;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Sakshyat
 */
public class LoginTest {
    
    public LoginTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

     @Test
    public void testLogin1() {
        System.out.println("loginUser");
     
        User user= new User();
        user.setUsername("test0");
        user.setPassword("test12345");
       
        UserLoginDao userLoginDao= new UserLoginDao();
        userLoginDao.loginUser(user);
        
        String expResult= "test0";
        String result= user.getUsername();
        assertEquals(expResult, result);
        
      
    }
    
    //Password field empty
    @Test
    public void testLogin2() {
        System.out.println("loginUser");
     
        User user= new User();
        user.setUsername("test0");
        user.setPassword("");
        
         UserLoginDao userLoginDao= new UserLoginDao();
        userLoginDao.loginUser(user);
        
        String expResult="Invalid user credentials";
        String result= userLoginDao.loginUser(user);
        assertEquals(expResult, result);
        
      
    }
    
    //Both username and password fields empty
    @Test
    public void testLogin3() {
        System.out.println("loginUser");
     
        User user= new User();
        user.setUsername("");
        user.setPassword("");
        
        UserLoginDao userLoginDao= new UserLoginDao();
        userLoginDao.loginUser(user);
        
        String expResult="Invalid user credentials";
        String result= userLoginDao.loginUser(user);
        assertEquals(expResult, result);
        
      
    }
    
     //Username field empty.
    @Test
    public void testLogin4() {
        System.out.println("loginUser");
     
        User user= new User();
        user.setUsername("");
        user.setPassword("123");
        
        UserLoginDao userLoginDao= new UserLoginDao();
        userLoginDao.loginUser(user);
        
        String expResult="Invalid user credentials";
        String result= userLoginDao.loginUser(user);
        assertEquals(expResult, result);
        
      
    }
    
    //Username and password do not match
    @Test
    public void testLogin5() {
        System.out.println("loginUser");
     
        User user= new User();
        user.setUsername("test0");
        user.setPassword("12345678");

        UserLoginDao userLoginDao= new UserLoginDao();
        userLoginDao.loginUser(user);
        
        String expResult="Invalid user credentials";
        String result= userLoginDao.loginUser(user);
        assertEquals(expResult, result);
      
    }
    
}
