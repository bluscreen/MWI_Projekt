package de.dhbw.grails.openData;

import java.nio.charset.Charset
import java.nio.charset.StandardCharsets

/**
 *
 * @author Marco K.
 *
 */
public class ConfigScanner {

	private final File filePath;
	private final static Charset ENCODING = StandardCharsets.UTF_8;

	/**
	 * Constructor.
	 *
	 * @param aFileName
	 *            full name of an existing, readable file.
	 */
	public ConfigScanner(String fileName) throws FileNotFoundException {
		filePath = new File(fileName);
	}

	public File getFilePath() {
		return filePath;
	}

	/** Template method that calls {@link #processLine(String)}. */
	public final void processLineByLine() throws IOException {
		String line = "";

		try {
			Scanner scanner = new Scanner(filePath, ENCODING.name())
			while (scanner.hasNextLine()) {
				line = scanner.nextLine();
				if (!line.equals("") && !line.substring(0, 1).equals("#")) {
					processLine(line);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Overridable method for processing lines in different ways.
	 */
	protected void processLine(String line) {
		Scanner scanner = new Scanner(line);
		scanner.useDelimiter("=");
		if (scanner.hasNext()) {
			String property = scanner.next();
			String value = scanner.next();

			property = property.trim();
			value = value.trim();

			switch (property) {
				case "DATABASE_PATH":
					Database.setDatabasePath(value);
					break;
				case "DB_USERNAME":
					Database.setDatabaseUsername(value);
					break;
				case "DB_PASSWORD":
					Database.setDatabasePassword(value);
					break;
				case "SCHEMA":
					Database.setDatabaseSchema(value);
					break;
			}
		} else {
			System.out.println("Empty or invalid line. Unable to process.");
		}
		scanner.close();
	}
}