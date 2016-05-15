/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

public class ReaderSet {
    
    public boolean setData(String id, String name, String birthday, String gender, String address, String phone, String passport){
        
        String sql = "INSERT INTO readership (id, name, birthday, gender, address, " + 
                "phone, passport) VALUES (" + id + ", '" + name + "', '" +
                birthday + "', '" + gender + "', '" + address + "', '" + phone + "', '" +
                passport + "');";
        
        SetData setData = new SetData();
        return setData.execute(sql);        
    }
}
