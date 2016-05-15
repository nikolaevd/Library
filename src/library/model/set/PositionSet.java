/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

import java.sql.*;
import library.model.LibraryDB;

public class PositionSet {
    
    public boolean setData(String id, String position, String salary, String responsibility, String requirements){
        
        String sql = "INSERT INTO positions (id, position, salary, " + 
                "responsibility, requirements) VALUES (" + id + ", '" + position + 
                "', " + salary + ", '" + responsibility + "', " +
                "'" + requirements + "');";
        
        SetData setData = new SetData();
        return setData.execute(sql);
        
    } 
}
