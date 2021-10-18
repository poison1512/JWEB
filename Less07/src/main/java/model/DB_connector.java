package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_connector {
	private static DB_connector instance;
	public DB_connector() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
		}
	}
	public static DB_connector getInstance() {
        if (instance == null) {
            instance = new DB_connector();
        }
        return instance;
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" + "user=root&password=");
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		return conn;
	}
}