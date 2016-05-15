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
 * @author Nikolaev
 */
public class EmployeeQuery {
    
    private List<EmployeeData> dataList;
    private String sql;
    
    public List<EmployeeData> getData(){
      
        dataList = new LinkedList<EmployeeData>();
        
        sql = "SELECT e.name, e.age, e.gender, e.address, e.phone, " + 
                    "e.passport, p.position, p.salary, p.responsibility, p.requirements\n " +
                    "FROM employees e\n" +
                    "	JOIN positions p ON p.id = e.position_id;";
        
        try(Connection connection = new LibraryDB().getConnection()){

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                EmployeeData data = new EmployeeData();
                data.setName(resultSet.getString(1));
                data.setAge(resultSet.getString(2));
                data.setGender(resultSet.getString(3));
                data.setAddress(resultSet.getString(4));
                data.setPhone(resultSet.getString(5));
                data.setPassport(resultSet.getString(6));
                data.setPosition(resultSet.getString(7));
                data.setSalary(resultSet.getString(8));
                data.setResponsibility(resultSet.getString(9));
                data.setRequirements(resultSet.getString(10));
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
    
    public List<EmployeeData> getData(String field, String value){
      
        dataList = new LinkedList<EmployeeData>();
        
        switch(field){
            case("position"):
                sql = "SELECT e.name, e.age, e.gender, e.address, e.phone, " +
                        "e.passport, p.position, p.salary, p.responsibility, " +
                        "p.requirements\n" +
                        "FROM employees e\n" +
                        "	JOIN positions p ON p.id = e.position_id\n" +
                        "WHERE p.position = '" + value + "'";
                break;
            default:
                System.out.println("Ошибка...");
        }
        
        try(Connection connection = new LibraryDB().getConnection()){

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while(resultSet.next()){
                EmployeeData data = new EmployeeData();
                data.setName(resultSet.getString(1));
                data.setPhone(resultSet.getString(5));
                data.setAddress(resultSet.getString(4));
                data.setSalary(resultSet.getString(8));
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
