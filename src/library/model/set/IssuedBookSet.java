/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model.set;

public class IssuedBookSet {
    
    public boolean setData(String id, String book_id, String readership_id, String date_of_issue, String return_date, String is_returned, String employee_id){
        
        String sql = "INSERT INTO issued_books (id, book_id, readership_id, " +
                "date_of_issue, return_date, is_returned, employee_id) VALUES (" + id + ", " + book_id + ", " +
                readership_id + ", '" + date_of_issue + "', '" + return_date + "' , " + is_returned + ", " +
                employee_id + ");";
        
        SetData setData = new SetData();
        return setData.execute(sql);        
    }
}
