/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import library.model.LibraryDB;

/**
 *
 * @author Nikolaev
 */
public class SetData {
    
    public boolean execute(String sql){
        
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
