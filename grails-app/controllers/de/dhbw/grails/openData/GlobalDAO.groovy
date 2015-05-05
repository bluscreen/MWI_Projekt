package de.dhbw.grails.openData;



/**
 * @author Raffaela F., Benny R.
 *
 * Class for retrieving data from the controller in general.
 *
 * You should only use ONE instance of this class for performance reasons.
 * 
 * 
 * 
 * 
 * 10.01 [DH] This architecture might cause concurrency issues
 *  Following changes necessary to integrate this class 
 * with groovy singleton pattern:
 * - Singleton annotation added
 * 
 */


@Singleton
public class GlobalDAO {

	// For caching: Caching is possible. The language table will not be updated
	// during runtime.
	List<Language> languageList = null;

	/**
	 * @return a list containing a Language object of each supported language
	 */
	public List<Language> getLanguagesList() {
		log.debug "getLanguagesList() called"
		if (languageList == null) {
			DatabaseInterface dbi = DatabaseInterface.getInstance();
			languageList = dbi.findLanguagesList();
		}

		return languageList;
	}

	public final static String TEXTID_State = "P17";
	public final static String TEXTID_City = "Q515";
	public final static String TEXTID_Person = "Q215627";
	public final static String TEXTID_Name = "Q82799";
	public final static String TEXTID_Education_Institute = "Q2385804";
	public final static String TEXTID_Job = "P106";
	public final static String TEXTID_Year_Of_Foundation = "P571";
	public final static String TEXTID_Phone = "P1329";
	public final static String TEXTID_Alumni = "Q508719";
	public final static String TEXTID_Address = "P319608";
	public final static String TEXTID_EMail = "P968";

	private class MaxSizeHashMap<K, V> extends LinkedHashMap<K, V> {
		private static final long serialVersionUID = 1L;
		private final int maxSize;

		public MaxSizeHashMap(int maxSize) {
			this.maxSize = maxSize;
		}

		@Override
		protected boolean removeEldestEntry(Map.Entry<K, V> eldest) {
			return size() > maxSize;
		}
	}

	private final MaxSizeHashMap<String, String> textCache = new MaxSizeHashMap<String, String>(
	300);

	/**
	 * @param textid
	 *            the TEXTID constant value of the corresponding text
	 * @param languageid
	 *            the id of the language
	 * @return the requested text in the requested language or null
	 */
	public String getText(String textid, String languageid) {
		log.debug "getText() called: textid:'" + textid + "', languageid: '" + languageid + "'" 
		// Use the concatenated textid + languageid as key for caching
		String key = textid + languageid;

		if (textCache.containsKey(key)) {
			return textCache.get(key);
		}

		DatabaseInterface dbi = DatabaseInterface.getInstance();
		String text = dbi.findText(textid, languageid);
		textCache.put(key, text);

		return text;
	}

	/**
	 * Search function for education institutes. All parameters are linked with
	 * AND. To use wildcards, set parameters null or use empty Strings. The
	 * institutes are returned in the set language.
	 *
	 * @param search_state
	 *            the entered value for "state". Empty strings and null will be
	 *            handled as wildcard.
	 * @param search_city
	 *            the entered value for "city". Empty strings and null will be
	 *            handled as wildcard.
	 * @param search_educationInstitute
	 *            the entered value for "education institute". Empty strings and
	 *            null will be handled as wildcard.
	 * @param search_alumnus
	 *            the entered value for "alumnus name". Empty strings and null
	 *            will be handled as wildcard.
	 * @param search_job
	 *            the entered value for "job". Empty strings and null will be
	 *            handled as wildcard.
	 * @param languageid
	 *            the id of the search language
	 * @return a list of all found education institutes that match to the
	 *         parameters. Null if all parameters are null or empty
	 */
	public List<EducationInstitute> searchEducationInstitutes(
			String search_state, String search_city,
			String search_educationInstitute, String search_alumnus,
			String search_job, String languageid) {
		log.info "searchEducationInstitutes() called"
		log.info ("params: search_state: '" + search_state +
				"' ,search_city: '" + search_city +
				"' ,search_educationInstitute: '" + search_educationInstitute +
				"' ,search_alumnus: '" + search_alumnus +
				"' ,search_job: '" + search_job +
				"' ,languageid: '" + languageid + "'")

		DatabaseInterface dbi = DatabaseInterface.getInstance();

		log.info "DatabaseInterface instance:" + dbi

		// If the search field is null or empty --> wildcard (null value)
		String state_id = (search_state == null || search_state.isEmpty() ? null
				: dbi.findItemIdByLabel(DatabaseInterface.CATEGORY_STATES,
				search_state, languageid));
		String city_id = (search_city == null || search_city.isEmpty() ? null
				: dbi.findItemIdByLabel(DatabaseInterface.CATEGORY_CITIES,
				search_city, languageid));
		String educationInstitute_id = (search_educationInstitute == null
				|| search_educationInstitute.isEmpty() ? null : dbi
				.findItemIdByLabel(
				DatabaseInterface.CATEGORY_EDUCATION_INSTITUTES,
				search_educationInstitute, languageid));
		String alumnus_id = (search_alumnus == null || search_alumnus.isEmpty() ? null
				: dbi.findItemIdByLabel(DatabaseInterface.CATEGORY_PERSONS,
				search_alumnus, languageid));
		String job_id = (search_job == null || search_job.isEmpty() ? null
				: dbi.findItemIdByLabel(DatabaseInterface.CATEGORY_JOBS,
				search_job, languageid));

		log.info ("ids: state_id: '" + state_id +
				"' ,city_id: '" + city_id +
				"' ,educationInstitute_id: '" + educationInstitute_id +
				"' ,alumnus_id: '" + alumnus_id +
				"' ,job_id: '" + job_id + "'")

		// Search the relevant ids
		List<String> educationInstituteids = dbi.searchEducationInstituteids(
				state_id, city_id, educationInstitute_id, alumnus_id, job_id);
		List<EducationInstitute> educationInstitutes = new ArrayList<>();

		// Get the data
		for (String educationInstituteid : educationInstituteids) {
			EducationInstitute educationInstitute = dbi
					.findEducationInstituteById(educationInstituteid, languageid);
			educationInstitutes.add(educationInstitute);
		}
		log.info "educationInstituteIds:"
		educationInstituteids.eachWithIndex { e, idx ->
			log.info "[" + idx + "]: " + e
		}
		
		log.info "educationInstitutes:"
		educationInstitutes.eachWithIndex { e, idx ->
			log.info "[" + idx + "]: " + e
		}

		return educationInstitutes;
	}

	/**
	 * @return a list containing basic information (see
	 *         EducationInstituteBasicInformation) about all education
	 *         institutes
	 */
	public List<EducationInstituteBasicInformation> getAllEducationInstitutes() {
		log.info "getAllEducationInstitutes() called"
		DatabaseInterface dbi = DatabaseInterface.getInstance();
		return dbi.findAllEducationInstitutes();
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
		log.info "getEducationInstitutesById() called"
		DatabaseInterface dbi = DatabaseInterface.getInstance();
		return dbi.findEducationInstituteById(educationInstituteid, languageid);
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
		log.info "getJobStatisticDatasetsByEducationInstituteId() called"
		DatabaseInterface dbi = DatabaseInterface.getInstance();
		return dbi.findJobStatisticDatasetsByEducationInstituteid(
		educationInstituteid, languageid);
	}
}