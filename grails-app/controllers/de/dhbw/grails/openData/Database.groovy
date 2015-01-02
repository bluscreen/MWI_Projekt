package de.dhbw.grails.openData;

import java.sql.Connection
import java.sql.DriverManager
import java.sql.SQLException

import javax.annotation.PostConstruct;

/**
 * 
 * @author 
 * 
 * [DH] Some Refactoring has been done here..
 *
 */
@Singleton
class Database {
	private Connection con

	final String driverClass = "com.mysql.jdbc.Driver"

	private String activeDbName = "wikidata2"

	final String jdbcURL = "jdbc:mysql://localhost:3306/"
	final String jdbcUSR = "root"
	final String jdbcPWD = "root"

	public Connection getConnection() {
		if(con==null) buildConnection()
		if(con==null) throw new RuntimeException("NO SQL CONNECTION OMGLAWL!!")
		return con
	}

	public void rebuildConnection(String newDatabaseReference) {
		this.setNewReference(newDatabaseReference)
		this.closeConnection()
		this.buildConnection()
	}

	private void setNewReference(String newDatabaseReference) {
		activeDbName = newDatabaseReference
	}

	private void buildConnection() {
		con = null

		try {
			Class.forName(driverClass);
			log.info "JDBC-Driver Class " + driverClass + " sucessfully found"
			con = DriverManager.getConnection(
					jdbcURL + activeDbName, jdbcUSR, jdbcPWD);
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
