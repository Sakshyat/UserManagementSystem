/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.herald.usermanagementsystem.test;

import com.herald.usermanagementsystem.dao.UserRegisterDao;
import com.herald.usermanagementsystem.model.User;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author asus
 */
public class RegisterTest {
    

    
    public RegisterTest() {
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
    public void testRegister1() {
        System.out.println("registerUser");
     
        User user= new User();
        user.setFirst_name("test0");
        user.setLast_name("test0");
        user.setEmail("test0@gmail.com");
        user.setUsername("test0");
        user.setPassword("test12345");
        user.setConfirm_pass("test12345");
        user.setPhone("1234567899");
        
        UserRegisterDao userRegisterDao= new UserRegisterDao();
        userRegisterDao.registerUser(user);
        
        String expResult= "test0";
        String result= user.getFirst_name();
        assertEquals(expResult, result);
        
      
    }
    
    //Username and email must be unique.
    @Test
    public void testRegister2() {
        System.out.println("registerUser");
     
        User user= new User();
        user.setFirst_name("test0");
        user.setLast_name("test");
        user.setEmail("test@gmail.com");
        user.setUsername("test0");
        user.setPassword("123");
        user.setConfirm_pass("123");
        user.setPhone("1234567891");
        
        UserRegisterDao userRegisterDao= new UserRegisterDao();
        userRegisterDao.registerUser(user);
        
        String expResult="Provide valid or unique details"; //message to be returned in case of sign up failure
        String result= userRegisterDao.registerUser(user);
        assertEquals(expResult, result);
        
      
    }
    
    //All fields must be filled.
    @Test
    public void testRegister3() {
        System.out.println("registerUser");
     
        User user= new User();
        user.setFirst_name("");
        user.setLast_name("");
        user.setEmail("");
        user.setUsername("");
        user.setPassword("");
        user.setConfirm_pass("");
        user.setPhone("");
        
        UserRegisterDao userRegisterDao= new UserRegisterDao();
        userRegisterDao.registerUser(user);
        
        String expResult="Provide valid or unique details";
        String result= userRegisterDao.registerUser(user);
        assertEquals(expResult, result);
        
      
    }
    
     //Password must be atleast 8 characters.
    @Test
    public void testRegister4() {
        System.out.println("registerUser");
     
        User user= new User();
        user.setFirst_name("test5");
        user.setLast_name("test4");
        user.setEmail("test5@gmail.com");
        user.setUsername("test5@gmail.com");
        user.setPassword("123");
        user.setConfirm_pass("123");
        user.setPhone("1234567890");
        
        UserRegisterDao userRegisterDao= new UserRegisterDao();
        userRegisterDao.registerUser(user);
        
        String expResult="Provide valid or unique details";
        String result= userRegisterDao.registerUser(user);
        assertEquals(expResult, result);
        
      
    }
    
    //Phone number must be of 10 characters.
    @Test
    public void testRegister5() {
        System.out.println("registerUser");
     
        User user= new User();
        user.setFirst_name("test5");
        user.setLast_name("test4");
        user.setEmail("test5@gmail.com");
        user.setUsername("test5@gmail.com");
        user.setPassword("12345678");
        user.setConfirm_pass("12345678");
        user.setPhone("123456");
        
        UserRegisterDao userRegisterDao= new UserRegisterDao();
        userRegisterDao.registerUser(user);
        
        String expResult="Provide valid or unique details";
        String result= userRegisterDao.registerUser(user);
        assertEquals(expResult, result);
        
      
    }
    
}
