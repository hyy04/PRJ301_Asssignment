/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Submit;

/**
 *
 * @author Admin
 */
public class SubmitDB extends DBContext {

    public Submit insert(String title, String start_date, String end_date, String created_by) {
        connection = getConnection();
        String sql = "INSERT INTO leave_requests (title, start_date, end_date, created_by, status) "
                + "VALUES (?, ?, ?, ?, 'Inprogress')";
        try {
            statement = connection.prepareStatement(sql);
            statement.setObject(1, title);
            statement.setObject(2, start_date);
            statement.setObject(3, end_date);
            statement.setObject(4, created_by);
            statement.executeUpdate();

        } catch (Exception e) {
        }

        return null;

    }
}
