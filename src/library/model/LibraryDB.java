/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model;

import java.sql.*;

/**
 *
 * @author nikol_000
 */
public class LibraryDB {
    
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/library";
    private static final String USER = "postgres";
    private static final String PASSWORD = "Iqex1234";
    
    public Connection getConnection() throws SQLException, ClassNotFoundException{
        
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        return connection;
        
    }
    
}
