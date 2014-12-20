package de.dhbw.grails.openData;

import java.sql.Connection
import java.sql.DriverManager
import java.sql.SQLException

class Database {
	public String dbName;
	private Connection con;

	Connection getConnection() {
		return con;
	}

	public void rebuildConnection(String newDatabaseReference) {
		this.setNewReference(newDatabaseReference);
		this.closeConnection();
		this.buildConnection();
	}

	private void setNewReference(String newDatabaseReference) {
		dbName = newDatabaseReference;
	}

	void buildConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Keine Treiber-Klasse!");
			e.printStackTrace();
			return;
		}

		con = null;
		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/wikidata2", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void closeConnection() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
