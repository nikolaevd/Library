/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

public class BookSet {
    
    public boolean setData(String id, String name, String author, String publishing_house_id, String date_of_publishing, String genre_id){
        
        String sql = "INSERT INTO books (id, name, author, publishing_house_id, " +
                "date_of_publishing, genre_id) VALUES (" + id + ", '" + name + "', '" +
                author + "', " + publishing_house_id + ", '" + date_of_publishing + "', " + genre_id + ");";
        
        SetData setData = new SetData();
        return setData.execute(sql);        
    }
}
