package de.dhbw.grails.openData;

import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardWatchEventKinds
import java.nio.file.WatchEvent
import java.nio.file.WatchKey
import java.nio.file.WatchService
import java.sql.DriverManager
import java.sql.SQLException

import com.mysql.jdbc.Connection

/**
 * @author Raffaela F., Benny R.
 */
class Database {
	private Connection con;

	final String driverClass = "com.mysql.jdbc.Driver";

	private static String database_schema = "";
	public static void setDatabaseSchema(String database_schema) {
		Database.database_schema = database_schema;
		println "schema: " + database_schema;
	}
	private static String database_path = "";
	public static void setDatabasePath(String database_path) {
		Database.database_path = database_path;
		println "path: " + database_path;
	}
	private static String database_username = "";
	public static void setDatabaseUsername(String database_username) {
		Database.database_username = database_username;
		println "username: " + database_username;
	}
	private static String database_password = "";
	public static void setDatabasePassword(String database_password) {
		Database.database_password = database_password;
		println "password: " + database_password;
	}

	// DEV VALUE:		"C:\\TEMP\\alumnetConfig"
	// PROD VALUE:		"/opt/wikidata/config"

//	public static final String confPath = "C:\\TEMP\\alumnetConfig"
//	public static final String filePath = "\\db_properties"
//	
	public static final String confPath = "/opt/wikidata/config"
	public static final String filePath = "/db_properties"

	public Database() {

		Path myDir = Paths
				.get(confPath);

		// Read db settings from file
		ConfigScanner parser = new ConfigScanner(myDir.toString()
				+ filePath);
		try {
			parser.processLineByLine();
		} catch (IOException e) {
			log.error "Problem reading File:", e
		}

		/**
		 * [DH] TODO this could cause memory leaks...
		 */
		new Thread() {

					@Override
					public void run() {
						log.info "Thread for ConfigScanner is running. Filepath is:" + Database.confPath
						while(true) {

							try {
								// Create a watcher for changes in file system
								WatchService watcher = myDir.getFileSystem().newWatchService();
								myDir.register(watcher, StandardWatchEventKinds.ENTRY_MODIFY);
								
								log.info "watchservice registered"

								WatchKey watckKey = watcher.take();

								List<WatchEvent<?>> events = watckKey.pollEvents();
								for (WatchEvent event : events) {

									// Changes in file "DB_PROPERTIES"? --> read file
									if (event.context().toString()
									.equalsIgnoreCase("DB_PROPERTIES")) {
										log.info "reading updated file"

										// Read db settings from file
										parser = new ConfigScanner(myDir.toString()
												+ filePath);
										try {
											parser.processLineByLine();
										} catch (IOException e) {
											log.error "Problem reading File:", e
										}

										// TODO [DH] this looks kind of invalid
										Database.this.rebuildConnection();
									}
								}

							} catch (Exception e) {
								/**
						 *  TODO [DH] This should have some real exception handling
						 */
								log.error "Something went wrong:", e
							}
						}
					}
				}.start();
	}

	public Connection getConnection() {
		if(con==null) {
			buildConnection();
		}
		if(con==null) {
			log.error "getConnection() Connection still null"
			throw new RuntimeException("No sql connection");
		}
		return con;
	}

	public void rebuildConnection() {
		this.closeConnection();
		this.buildConnection();
	}

	private void buildConnection() {
		con = null;

		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			log.error "Driver not found ", e
		}

		try{
			//TODO:String connector = database_path + "_" + database_schema;
			String connector = database_path + "_" + database_schema;
			con = DriverManager.getConnection("jdbc:mysql://" + connector , database_username, database_password);
		} catch (SQLException e) {
			log.error "SQL Exception trying to get Connection ", e
		}
	}

	private void closeConnection() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				log.error "Error trying to close connection", e
			}
		}
	}
}