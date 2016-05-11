/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.get;

import library.model.LibraryDB;
import java.sql.*;
import java.util.List;

/**
 *
 * @author nikol_000
 */
public class CatalogQuery {
    
    private List<CatalogData> dataList;
    
    public List<CatalogData> getData(){
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            String sql = "";
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                CatalogData data = new CatalogData();
                data.setName(resultSet.getString("name"));
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
