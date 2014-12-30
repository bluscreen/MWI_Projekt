package de.dhbw.grails.openData;

import java.sql.Connection
import java.sql.DriverManager
import java.sql.SQLException

class Database {
	public String dbName
	private Connection con

	static final String driverClass = "com.mysql.jdbc.Driver"
	static final String jdbcURL = "jdbc:mysql://localhost:3306/wikidata2"
	static final String jdbcUSR = "root"
	static final String jdbcPWD = "root"

	public void rebuildConnection(String newDatabaseReference) {
		this.setNewReference(newDatabaseReference)
		this.closeConnection()
		this.buildConnection()
	}

	private void setNewReference(String newDatabaseReference) {
		dbName = newDatabaseReference
	}

	void buildConnection() {
		con = null

		try {
			Class.forName(driverClass);
			log.info "JDBC-Driver Class " + driverClass + " sucessfully found"
			con = DriverManager.getConnection(
					jdbcURL, jdbcUSR, jdbcPWD);
		} catch (ClassNotFoundException e) {
			log.error "No JDBC Driver found!", e
		} catch (SQLException e) {
			log.error "Couldnt establish JDBC Connection", e
		}
	}

	private void closeConnection() {
		if (con != null) {
			try {
				con.close()
			} catch (SQLException e) {
				log.error "Error trying to close JDBC Connection", e
			}
		}
	}
}
