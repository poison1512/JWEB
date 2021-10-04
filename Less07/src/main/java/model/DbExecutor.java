package model;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbExecutor {
	public static final String SELECT_USER = "SELECT name FROM users WHERE login=? AND password=?";
	public static final String INSERT_USER = "INSERT INTO users (name, login, password) VALUES(?,?,?)";

	public String checkLogin(String login, String password) {
		String name = null;
		Connection conn = DB_connector.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(SELECT_USER);
			ps.setString(1, login);
			ps.setString(2, getSaltedHashedPassword(password));
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException ex) {

			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
			}
		}
		return name;
	}

	public void addUser(String name, String login, String password) {
		Connection conn = DB_connector.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(INSERT_USER);
			ps.setString(1, name);
			ps.setString(2, login);
			ps.setString(3, getSaltedHashedPassword(password));
			ps.executeUpdate();
		} catch (SQLException e) {
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException ex) {
			}
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
			}
		}
	}

	private String getSaltedHashedPassword(String password) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String passphrase = "secret" + password;
		md.update(passphrase.getBytes(StandardCharsets.UTF_8));
		return String.format("%064x", new BigInteger(1, md.digest()));
	}
}