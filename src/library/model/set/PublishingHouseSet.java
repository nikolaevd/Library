/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

public class PublishingHouseSet {
    
    public boolean setData(String id, String name, String city, String address){
        
        String sql = "INSERT INTO publishing_house(id, name, city, address) " +
                "VALUES (" + id + ", '" + name + "', '" + city + "', '" + address + "');";
        
        SetData setData = new SetData();
        return setData.execute(sql);        
    }
}
