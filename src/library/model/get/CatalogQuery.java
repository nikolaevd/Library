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

public class CatalogQuery {
    
    private List<CatalogData> dataList;
    private String sql;
    
    public List<CatalogData> getData(){
        
        dataList = new LinkedList<>();
        
        sql = "SELECT b.name, b.author, b.date_of_publishing, " + 
                    "g.name, g.description, p.name, p.city, p.address\n" +
                    "FROM books b\n" +
                    "JOIN publishing_house p ON p.id = b.publishing_house_id\n" +
                    "JOIN genres g ON g.id = b.genre_id;";
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                CatalogData data = new CatalogData();
                data.setName(resultSet.getString(1));
                data.setAuthor(resultSet.getString(2));
                data.setDate(resultSet.getString(3));
                data.setGenre(resultSet.getString(4));
                data.setDescription(resultSet.getString(5));
                data.setPublishingHouse(resultSet.getString(6));
                data.setCity(resultSet.getString(7));
                data.setAddress(resultSet.getString(8));
                dataList.add(data);
            }
            
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
        
        return dataList;
    }
    
    public List<CatalogData> getData(String field, String value){
        
        dataList = new LinkedList<>();
        
        switch(field){
            case("publishing_house"):
                sql = "SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address\n" +
                        "FROM books b\n" +
                        "	JOIN publishing_house p ON p.id = b.publishing_house_id\n" +
                        "	JOIN genres g ON g.id = b.genre_id\n" +
                "WHERE p.name = '" + value + "';";
                break;
            case("author"):
                sql = "SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address\n" +
                        "FROM books b\n" +
                        "	JOIN publishing_house p ON p.id = b.publishing_house_id\n" +
                        "	JOIN genres g ON g.id = b.genre_id\n" +
                        "WHERE b.author = '" + value + "';";
                break;
            case("date"):
                sql = "SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address\n" +
                        "FROM books b\n" +
                        "	JOIN publishing_house p ON p.id = b.publishing_house_id\n" +
                        "	JOIN genres g ON g.id = b.genre_id\n" +
                        "WHERE b.date_of_publishing = '" + value + "';";
                break; 
            default:
                System.out.println("Ошибка...");
        }
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                CatalogData data = new CatalogData();
                data.setName(resultSet.getString(1));
                data.setAuthor(resultSet.getString(2));
                data.setDate(resultSet.getString(3));
                data.setGenre(resultSet.getString(4));
                data.setDescription(resultSet.getString(5));
                data.setPublishingHouse(resultSet.getString(6));
                data.setCity(resultSet.getString(7));
                data.setAddress(resultSet.getString(8));
                dataList.add(data);
            }
            
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
        
        return dataList;
    }
}
