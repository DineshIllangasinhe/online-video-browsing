package com.video;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    
    private static String url = "jdbc:mysql://localhost:3308/videomgmt";
    private static String username = "root";
    private static String password = "sliit";
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("Database Connection is not successful!!!");
            e.printStackTrace(); // print the exception details for debugging
        }
        return con;
    }
}
