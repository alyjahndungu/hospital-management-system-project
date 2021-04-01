package com.lanmedics.lanmedics.database;

import java.sql.*;

public class DatabaseConnector {
	public static Connection getDatabase() {
		Connection con;
		try {
			String url = "jdbc:mysql://localhost:3306/lansmedical";
			String user = "root";
			String password = "";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("Connection failure" + e);
			e.printStackTrace();
		}

		return null;
	}

}