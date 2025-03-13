/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Account;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class AccDb extends DBContext{
    public Account get(String username, String password){
        connection = getConnection();
        String sql = "SELECT *\n"
                + "  FROM account\n"
                + "where username = ? and [password] = ?";
        try {
            //- Tạo đối tượng PrepareStatement
            statement = connection.prepareStatement(sql);
            //- Set parameter ( optional )
            statement.setObject(1, username);
            statement.setObject(2, password);
            //- Thực thi câu lệnh
            resultSet = statement.executeQuery();
            //- trả về kết quả
            if (resultSet.next()) {
                String user = resultSet.getString("username");
                String pass = resultSet.getString("password");
                Account account = new Account(resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getInt(4),
                        resultSet.getInt(5));
//                Account account = new Account(username, password);

                return account;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        
        
        
        return null;
        
    }
}
