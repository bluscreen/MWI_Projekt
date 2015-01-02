package de.dhbw.grails.openData

import java.sql.Connection
import java.sql.PreparedStatement
import java.sql.ResultSet
import java.sql.SQLException

/**
 * TODO [DH] Dokumentation und Refactoring (siehe TODOS) 
 * Anmerkung: alle bisherigen get* Methoden (bitte statt get hier find o.ä. Schlagwort für Namensgebung benutzen)
 * weisen im wesentlichen Duplicate Code auf
 *
 */

@Singleton
public class DatabaseInterface {
	private Database db = Database.instance

	public static final String CATEGORY_PERSONS = "persons_"
	public static final String CATEGORY_JOBS = "jobs_"
	public static final String CATEGORY_STATES = "states_"// TODO wirklich
	// states_?
	public static final String CATEGORY_CITIES = "cities_"// TODO wirklich
	// cities_?
	public static final String CATEGORY_EDUCATION_INSTITUTES = "education_institutes_"// TODO
	// wirklich
	// education_institutes_?
	// TODO: Die anderen Kategorien hier einf�gen

	public static final String VIEW_NAME_SUFU = "sufu"
	public static final String VIEW_NAME_PERSON = "person"
	public static final String VIEW_NAME_EDUCATION_INSTITUTE = "educationinstitute"

	public static final String PROPERTY_ID_HAT_ABSCHLUSS_VON = "P123"// TODO
	// (dieser
	// wert
	// ist
	// nur
	// ein
	// beispiel
	// und
	// falsch)

	/**
	 * Using the <item>_label table
	 * 
	 * @param category
	 *            the CATEGORY constant
	 * @param label
	 *            the label field
	 * @param language
	 *            the language key
	 * @return the id of this item
	 */
	public String getItemIdByLabel(String category, String label,
			String language) {

		String itemId = null
		Connection con = null

		try {

			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT item_id FROM " + category
					+ "label WHERE label = ? AND language = ?")
			pstmt.setString(1, label)
			pstmt.setString(2, language)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				if (rs.next()) {
					itemId = rs.getString(1)
				} else {

					// Nothing found in label table --> use alias table
					// ("Also known as ...")

					pstmt = con.prepareStatement("SELECT item_id FROM "
							+ category
							+ "alias WHERE alias = ? AND language = ?")
					pstmt.setString(1, label)
					pstmt.setString(2, language)

					if (rs.next()) {
						itemId = rs.getString(1)
					}
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return itemId

	}

	/**
	 * Using the <item>_label table
	 * 
	 * @param category
	 *            the CATEGORY constant
	 * @param itemId
	 *            the item id field
	 * @param language
	 *            the language key
	 * @return the label of this item
	 */
	public String getLabelByItemId(String category, String itemId,
			String language) {

		String label = null
		Connection con = null

		try {

			con = db.getConnection()
			PreparedStatement pstmt = con.prepareStatement("SELECT label FROM "
					+ category + "label WHERE item_id = ? AND language = ?")
			pstmt.setString(1, itemId)
			pstmt.setString(2, language)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				if (rs.next()) {
					label = rs.getString(1)
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return label
	}

	/**
	 * Using the <item>_link table
	 * 
	 * @param category
	 *            the CATEGORY constant
	 * @param itemId
	 *            the item id field
	 * @param language
	 *            the language key
	 * @return the link of this item
	 */
	public String getUrlByItemId(String category, String itemId, String language) {
		String wikiId = language + "wiki"
		String link = null
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con.prepareStatement("SELECT url FROM "
					+ category + "link WHERE item_id = ? AND language = ?")
			pstmt.setString(1, itemId)
			pstmt.setString(2, wikiId)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				if (rs.next()) {
					link = rs.getString(1)
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return link

	}

	/**
	 * Using the <item>_description table
	 * 
	 * @param category
	 *            the CATEGORY constant
	 * @param itemId
	 *            the item id field
	 * @param language
	 *            the language key
	 * @return the description of this item
	 */
	public String getDescriptionByItemId(String category, String itemId,
			String language) {

		String description = null
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT description FROM " + category
					+ "desc WHERE item_id = ? AND language = ?")
			pstmt.setString(1, itemId)
			pstmt.setString(2, language)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				if (rs.next()) {
					description = rs.getString(1)
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return description

	}

	/**
	 * Using table <item>_claim
	 * 
	 * @param category
	 *            the CATEGORY constant
	 * @param value
	 *            the value field
	 * @param propertyId
	 *            the PROPERTY constant
	 * @return a list of item ids
	 */
	public List<String> getItemIdsByValueAndPropertyId(String category,
			String value, String propertyId) {

		List<String> itemIds = new ArrayList<String>()
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT item_id FROM " + category
					+ "claim WHERE value = ? AND property = ?")
			pstmt.setString(1, value)
			pstmt.setString(2, propertyId)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				while (rs.next()) {
					itemIds.add(rs.getString(1))
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return itemIds

	}

	/**
	 * Using table <item>_claim
	 * 
	 * @param category
	 *            the CATEGORY constant
	 * @param itemId
	 *            the item id field
	 * @param propertyId
	 *            the PROPERTY constant
	 * @return a list of values
	 */
	public List<String> getValuesByItemIdAndPropertyId(String category,
			String itemId, String propertyId) {

		List<String> values = new ArrayList<String>()
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con.prepareStatement("SELECT value FROM "
					+ category + "claim WHERE item_id = ? AND property = ?")
			pstmt.setString(1, itemId)
			pstmt.setString(2, propertyId)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				while (rs.next()) {
					values.add(rs.getString(1))
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return values

	}

	/**
	 * Search function for education institutes. All parameters are linked with
	 * AND. To use wildcards, set parameters null or use empty Strings.
	 * 
	 * @param state_id
	 *            the id of "state". Null will be handled as wildcard.
	 * @param city_id
	 *            the id of "city". Null will be handled as wildcard.
	 * @param educationInstitute_id
	 *            the id of "education institute". Null will be handled as
	 *            wildcard.
	 * @param alumnus_id
	 *            the id of "alumnus name". Null will be handled as wildcard.
	 * @param job_id
	 *            the id of "job". Null will be handled as wildcard.
	 * @param languageid
	 *            the id of the search language
	 * @return a list of all found education institute ids that match to the
	 *         parameters. If all parameters are wildcards, null will be returned.
	 */
	public List<String> searchEducationInstituteids(String state_id,
			String city_id, String educationInstitute_id, String alumnus_id,
			String job_id, String languageid) {

		List<String> educationInstituteids = new ArrayList<String>()
		Connection con = null

		try {
			con = db.getConnection()

			// location for this parameter in the sql statement
			int locationStateId = 0
			int locationCityId = 0
			int locationEducationInstituteId = 0
			int locationAlumnusId = 0
			int locationJobId = 0
			int currentId = 0

			String sql = "SELECT UNI_ID FROM " + VIEW_NAME_SUFU + " WHERE "
			if (state_id != null) {
				sql += "STATE_ID = ? "
				locationStateId = ++currentId
			}
			if (city_id != null) {
				if (currentId > 0) {
					sql += "AND "
				}
				sql += "CITY_ID = ? "
				locationCityId = ++currentId
			}
			if (educationInstitute_id != null) {
				if (currentId > 0) {
					sql += "AND "
				}
				sql += "UNI_ID = ? "
				locationEducationInstituteId = ++currentId
			}
			if (alumnus_id != null) {
				if (currentId > 0) {
					sql += "AND "
				}
				sql += "PERSON_ID = ? "
				locationAlumnusId = ++currentId
			}
			if (job_id != null) {
				if (currentId > 0) {
					sql += "AND "
				}
				sql += "JOB_ID = ? "
				locationJobId = ++currentId
			}

			// No parameters at all? --> return null.
			if(currentId == 0) {
				return null
			}

			PreparedStatement pstmt = con.prepareStatement(sql)
			if (locationStateId != 0) {
				pstmt.setString(locationStateId, state_id)
			}

			if (locationCityId != 0) {
				pstmt.setString(locationCityId, city_id)
			}

			if (locationEducationInstituteId != 0) {
				pstmt.setString(locationEducationInstituteId,
						educationInstitute_id)
			}

			if (locationAlumnusId != 0) {
				pstmt.setString(locationAlumnusId, alumnus_id)
			}

			if (locationJobId != 0) {
				pstmt.setString(locationJobId, job_id)
			}

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				while (rs.next()) {
					educationInstituteids.add(rs.getString(1))
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return educationInstituteids
	}

	/**
	 * @return a list containing basic information (see
	 *         EducationInstituteBasicInformation) about all education
	 *         institutes
	 */
	public List<EducationInstituteBasicInformation> getAllEducationInstitutes() {

		List<EducationInstituteBasicInformation> educationInstitutesBasicInformation = new ArrayList<>()
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT longitude, latitude, id FROM "
					+ VIEW_NAME_EDUCATION_INSTITUTE)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				while (rs.next()) {
					double longitude = 0, latitude = 0
					String id = ""
					try {
						longitude = rs.getDouble("longitude")// TODO: Pr�fen,
						// ob es ein
						// Double ist
						// oder ein
						// String
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						latitude = rs.getDouble("latitude")// TODO: Pr�fen, ob
						// es ein Double ist
						// oder ein String
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						id = rs.getString("id")
					} catch (SQLException e) {
						e.printStackTrace()
					}

					educationInstitutesBasicInformation
							.add(new EducationInstituteBasicInformation(
							longitude, latitude, id))
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return educationInstitutesBasicInformation
	}

	/**
	 * @param educationInstituteid
	 *            the id of the requested education institute
	 * @param languageid
	 *            the id of the requested language
	 * @return the EducationInstitute with the corresponding id and all values
	 *         translated into the requested language
	 */
	public EducationInstitute getEducationInstituteById(
			String educationInstituteid, String languageid) {

		EducationInstitute educationInstitute = null
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM "
					+ VIEW_NAME_EDUCATION_INSTITUTE
					+ " WHERE id = ? AND language = ? ")
			pstmt.setString(1, educationInstituteid)
			pstmt.setString(2, languageid)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				if (rs.next()) {
					double longitude = 0, latitude = 0
					String name = "", state = "", city = "", zipCode = "", streetAndHouseNumber = "", phone = "", email = "", yearOfFoundation = "", educationInstituteDescription = "", wikipediaHyperlink = ""
					try {
						longitude = rs.getDouble("longitude")// TODO: Pr�fen,
						// ob es ein
						// Double ist
						// oder ein
						// String
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						latitude = rs.getDouble("latitude")// TODO: Pr�fen, ob
						// es ein Double ist
						// oder ein String
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						name = rs.getString("name")
						if (name == null) {
							name = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						state = rs.getString("state")
						if (state == null) {
							state = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						city = rs.getString("city")
						if (city == null) {
							city = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						zipCode = rs.getString("zip_code")
						if (zipCode == null) {
							zipCode = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						streetAndHouseNumber = rs
								.getString("street_and_house_number")
						if (streetAndHouseNumber == null) {
							streetAndHouseNumber = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						phone = rs.getString("phone")
						if (phone == null) {
							phone = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						email = rs.getString("email")
						if (email == null) {
							email = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						yearOfFoundation = rs.getString("year_of_foundation")
						if (yearOfFoundation == null) {
							yearOfFoundation = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						educationInstituteDescription = rs
								.getString("education_institute_description")
						if (educationInstituteDescription == null) {
							educationInstituteDescription = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}
					try {
						wikipediaHyperlink = rs
								.getString("wikipedia_hyperlink")
						if (wikipediaHyperlink == null) {
							wikipediaHyperlink = ""
						}
					} catch (SQLException e) {
						e.printStackTrace()
					}

					List<Alumnus> alumni = this.getAlumniByEducationInstituteid(educationInstituteid, languageid)
					List<JobStatisticDataset> jobStatisticDataset = this.getJobStatisticDatasetsByEducationInstituteid(educationInstituteid, languageid)

					educationInstitute = new EducationInstitute(longitude,
							latitude, educationInstituteid, name, state, city,
							zipCode, streetAndHouseNumber, phone, email,
							yearOfFoundation, educationInstituteDescription,
							wikipediaHyperlink, jobStatisticDataset, alumni)
				}
				try {
					if (rs != null)
						rs.close()
				} catch (Exception e) {
				}
			}
			try {
				if (pstmt != null)
					pstmt.close()
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return educationInstitute
	}

	/**
	 * @return a list containing a Language object of each supported language
	 */
	public List<Language> getLanguagesList() {

		List<Language> languageList = new ArrayList<>()

		Connection con = null

		try {

			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT * FROM languages")

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				while (rs.next()) {
					String languageId = rs.getString("language")
					String languageName = rs.getString("text")

					Language language = new Language(languageId, languageName)
					languageList.add(language)
				}
				try {
					if (rs != null) {
						rs.close()
					}
				} catch (Exception e) {
				
				}
			}
			try {
				if (pstmt != null) {
					pstmt.close()
				}
			} catch (Exception e) {
			}
		} catch (SQLException e) {
			e.printStackTrace()
		}

		return languageList
	}

	/**
	 * 
	 * @param educationInstituteid
	 *            the id of the requested education institute
	 * @param languageid
	 *            the id of the requested language
	 * @return the list of JobStatisticDatasets
	 */
	public List<JobStatisticDataset> getJobStatisticDatasetsByEducationInstituteid(
			String educationInstituteid, String languageid) {
		List<JobStatisticDataset> jobStatisticDatasets = new ArrayList<>()

		Connection con = null

		try {

			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT jobs.label AS jobname, count(sufu.JOB_ID)  AS jobcount FROM sufu AS sufu INNER JOIN jobs_label AS jobs ON sufu.JOB_ID = jobs.item_id WHERE sufu.UNI_ID = ? and language = ? GROUP BY JOB_ID")

			pstmt.setString(1, educationInstituteid)
			pstmt.setString(2, languageid)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				int total = 0
				while (rs.next()) {
					String jobname = rs.getString("jobname")
					int jobcount = Integer.parseInt(rs.getString("jobcount"))
					JobStatisticDataset jobStatisticDataset = new JobStatisticDataset(
							jobname, jobcount)
					jobStatisticDatasets.add(jobStatisticDataset)
					total += jobcount
				}

				for (JobStatisticDataset jobStatisticDataset : jobStatisticDatasets) {
					jobStatisticDataset.setTotal(total)
				}
				try {
					if (rs != null) {
						rs.close()
					}
				} catch (Exception e) {
					// TODO Logging/Exception Handling..
				}
			}
			try {
				if (pstmt != null) {
					pstmt.close()
				}
			} catch (Exception e) {
				// TODO Logging/Exception Handling.. Duplicate Code!
			}
		} catch (SQLException e) {
			e.printStackTrace()
			// TODO Logging/Exception Handling.. Duplicate Code!
		}

		return jobStatisticDatasets
	}

	/**
	 *
	 * @param educationInstituteid
	 *            the id of the requested education institute
	 * @param languageid
	 *            the id of the requested language
	 * @return the list of Alumni
	 */
	public List<Alumnus> getAlumniByEducationInstituteid(
			String educationInstituteid, String languageid) {
		List<Alumnus> alumni = new ArrayList<>()

		Connection con = null

		try {

			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT persons.name AS personname, persons.job_title, persons.wikipedia_hyperlink FROM sufu AS sufu INNER JOIN person AS persons ON sufu.PERSON_ID = persons.person_ID WHERE sufu.UNI_ID = ? and language = ?")

			pstmt.setString(1, educationInstituteid)
			pstmt.setString(2, languageid)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				int total = 0
				while (rs.next()) {
					String personname = rs.getString("personname")
					String jobtitle = rs.getString("job_title")
					String wikipediaLink = rs.getString("wikipedia_hyperlink")
					Alumnus alumnus = new Alumnus(personname, jobtitle, wikipediaLink)
					alumni.add(alumnus)
				}
				try {
					if (rs != null) {
						rs.close()
					}
				} catch (Exception e) {
					// TODO Logging/Exception Handling..
				}
			}
			try {
				if (pstmt != null) {
					pstmt.close()
				}
			} catch (Exception e) {
				// TODO Logging/Exception Handling..
			}
		} catch (SQLException e) {
			e.printStackTrace()
			// TODO Logging/Exception Handling.. Duplicate Code!
		}

		return alumni
	}

	/**
	 * @param textid
	 *            the TEXTID constant value of the corresponding text
	 * @param languageid
	 *            the id of the language
	 * @return the requested text in the requested language or null
	 * 
	 * TODO:[DH] Refactoring Methodenname; Vielleicht eher sowas wie: findLabelByLanguage
	 */
	public String getText(String textid, String languageid) {
		String text = ""
		Connection con = null

		try {
			con = db.getConnection()
			PreparedStatement pstmt = con
					.prepareStatement("SELECT label, description FROM properties WHERE language = ? AND property_id = ?")

			pstmt.setString(1, languageid)
			pstmt.setString(2, textid)

			if (pstmt.execute()) {
				ResultSet rs = pstmt.getResultSet()
				if (rs.next()) {
					text = rs.getString("label")
					// No text? Maybe there is a description in that language...
					if (text == null || text.isEmpty()) {
						text = rs.getString("description")
					}
				}
				try {
					if (rs != null)	{
						rs.close()
					}
				}
				catch (Exception e) {
					log.error "Error closing ResultSet",e
				}
			}
			try {
				/**
				 * Bitte auch bei Einzeilern immer geschweifte Klammern nach if/else
				 */
				if (pstmt != null) {
					pstmt.close()
				}
			} catch (Exception e) {
				log.error "Error closing PreparedStatement ", e
			}
		} catch (SQLException e) {
			log.error "SQL-Exception", e
		}

		// No text at all? Use english as fallback
		if (text == null || text.isEmpty()) {
			if (!languageid.equals("en")) {
				text = getText(textid, "en")
			} else {
				text = "#ERROR#"
			}
		}

		return text
	}
}
