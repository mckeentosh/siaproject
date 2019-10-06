 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mckee
 */
public class Dao {
    private static Connection con;
    public static Connection getCon(){
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com:5432/d4vm9n5pcuq9pv?sslmode=require","wpyfudjzokenfz","57813cdd2c509fafd01ee81ca53e7827ef8a0fc1e342fab0654e5637b0c6fa23");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }
}
