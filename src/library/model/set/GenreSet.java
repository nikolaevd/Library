/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

/**
 *
 * @author Nikolaev
 */
public class GenreSet {
    
    public boolean setData(String id, String name, String description){
        
        String sql = "INSERT INTO genres(id, name, description) VALUES " +
                "(" + id + ", '" + name + "', '" + description + "');";
        
        SetData setData = new SetData();
        return setData.execute(sql);        
    }
}
