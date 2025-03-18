/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Submit;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.util.Date;


/**
 *
 * @author Admin
 */
public class viewRequestsDB extends DBContext{
    
    public List<Submit> findAll(){
        List<Submit> listView = new ArrayList<>();
        
        connection = getConnection();
        
        String sql = "SELECT* FROM leave_requests";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            while (resultSet.next()) {                
                String title = resultSet.getString("title");
                Date start_date = resultSet.getDate("start_date");
                Date end_date = resultSet.getDate("end_date");
                String created_by = resultSet.getString("created_by");
                String status = resultSet.getString("status");
                String processed_by = resultSet.getString("processed_by");
                Submit submit = new Submit();
                
                listView.add(submit);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return listView;
    }
    
     
}
