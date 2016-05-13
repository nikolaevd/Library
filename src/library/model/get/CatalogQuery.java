/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.get;

import library.model.LibraryDB;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author nikol_000
 */
public class CatalogQuery {
    
    private List<CatalogData> dataList;
    
    public List<CatalogData> getData(){
        
        dataList = new LinkedList<CatalogData>();
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            String sql = "SELECT b.name, b.author, b.date_of_publishing, " + 
                    "g.name, g.description, p.name, p.city, p.address\n" +
                    "FROM books b\n" +
                    "JOIN publishing_house p ON p.id = b.publishing_house_id\n" +
                    "JOIN genres g ON g.id = b.genre_id;";
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                CatalogData data = new CatalogData();
                data.setName(resultSet.getString(1));
                data.setAuthor(resultSet.getString(2));
                data.setGenre(resultSet.getString(4));
                data.setPublishingHouse(resultSet.getString(6));
                // и т.д.
                dataList.add(data);
            }
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return dataList;
    }
}
