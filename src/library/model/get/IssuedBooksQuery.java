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

public class IssuedBooksQuery {
    
    private List<IssuedBooksData> dataList;
    private String sql;
    
    public List<IssuedBooksData> getData(){
        
        dataList = new LinkedList<>();
        
        sql = "SELECT b.name, b.author, r.name, r.phone, r.address, i.date_of_issue\n" +
                "FROM readership r\n" +
                "	JOIN issued_books i ON i.readership_id = r.id\n" +
                "	JOIN books b ON b.id = i.book_id\n" +
                "	JOIN employees e ON e.id = i.employee_id\n" +
                "WHERE i.is_returned = false;";
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                IssuedBooksData data = new IssuedBooksData();
                data.setBook(resultSet.getString(1));
                data.setAuthor(resultSet.getString(2));
                data.setReader(resultSet.getString(3));
                data.setPhone(resultSet.getString(4));
                data.setAddress(resultSet.getString(5));
                data.setDate(resultSet.getString(6));
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
    
    public List<IssuedBooksData> getData(String field, String value){
        
        dataList = new LinkedList<>();
        
        switch(field){
            case("is_returned"):
                sql = "SELECT b.name, b.author, r.name, r.phone, r.address, i.date_of_issue\n" +
                        "FROM readership r\n" +
                        "	JOIN issued_books i ON i.readership_id = r.id\n" +
                        "	JOIN books b ON b.id = i.book_id\n" +
                        "	JOIN employees e ON e.id = i.employee_id\n" +
                        "WHERE i.is_returned = " + value + ";";
                break;
            case("reader"):
                sql = "SELECT b.name, b.author, r.name, r.phone, r.address, i.date_of_issue\n" +
                        "FROM readership r\n" +
                        "	JOIN issued_books i ON i.readership_id = r.id\n" +
                        "	JOIN books b ON b.id = i.book_id\n" +
                        "	JOIN employees e ON e.id = i.employee_id\n" +
                        "WHERE i.is_returned = false AND r.name = '" + value + "';";
                break;  
            default:
                System.out.println("Ошибка...");
        }
        
        try(Connection connection = new LibraryDB().getConnection()){
            
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                IssuedBooksData data = new IssuedBooksData();
                data.setBook(resultSet.getString(1));
                data.setAuthor(resultSet.getString(2));
                data.setReader(resultSet.getString(3));
                data.setPhone(resultSet.getString(4));
                data.setAddress(resultSet.getString(5));
                data.setDate(resultSet.getString(6));
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
