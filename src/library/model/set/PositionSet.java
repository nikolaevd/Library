/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

import java.sql.*;
import library.model.LibraryDB;

/**
 *
 * @author Nikolaev
 */
public class PositionSet {
    
    public boolean setData(String id, String position, String salary, String responsibility, String requirements){
        
        String sql = "INSERT INTO positions (id, position, salary, " + 
                "responsibility, requirements) VALUES (" + id + ", '" + position + 
                "', " + salary + ", '" + responsibility + "', " +
                "'" + requirements + "');";
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            Statement statement = connection.createStatement();
            statement.execute(sql);
            return true;
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    } 
}
