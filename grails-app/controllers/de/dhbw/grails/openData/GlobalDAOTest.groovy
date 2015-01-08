/**
 *
 */
package de.dhbw.grails.openData;

import java.text.SimpleDateFormat



/**
 * @author Raffaela F., Benny R.
 *
 * Test class for testing the controller functionality using a real database
 *
 * Why a static main method and not a unit test?
 * - it is possible to see the performance of program parts
 * - this test depends on real data and not on mock data
 * - the used data (e. g. for the search functionality) are not static (in some parts) but real data
 */
public class GlobalDAOTest {

	/**
	 * This method calls all controller functions (GlobalDAO) to retrieve data from the database.
	 * Furthermore a field of possible search parameters is build with the real data.
	 * At the end of the test, the search function will be tested.
	 *
	 * @param args
	 */
	public static void main(String[] args) {


		// List of search parameter sets. State, City, education institute, alumnus name, job title, language id
		List<String[]> search = new ArrayList<String[]>();
		search.add([null, null, null, null, null, null]);
		search.add([null, null, null, null, null, "de"]);
		search.add(["BLABLABLA##123", null, null, null, null, "de"]);
		search.add([null, "BLABLABLA##123", null, null, null, "de"]);
		search.add([null, null, "BLABLABLA##123", null, null, "de"]);
		search.add([null, null, null, "BLABLABLA##123", null, "de"]);
		search.add([null, null, null, null, "BLABLABLA##123", "de"]);

		// to know whether the parameters are set
		boolean searchParameterSet = false;

		log("--- Start test ---");
		log("--- Get controller instance ---");
		GlobalDAO controller = new GlobalDAO();
		log("done");

		System.out.println("");

		log("--- Get all education institutes ---");
		List<EducationInstituteBasicInformation> eduInstBasInfList = controller
				.getAllEducationInstitutes();
		log("Got " + eduInstBasInfList.size() + " objects:");
		for (EducationInstituteBasicInformation educationInstituteBasicInformation : eduInstBasInfList) {
			log("id: <" + educationInstituteBasicInformation.getId()
					+ ">, latitude: <"
					+ educationInstituteBasicInformation.getLatitude()
					+ ">, longitude: <"
					+ educationInstituteBasicInformation.getLongitude() + ">");
		}
		log("done");

		System.out.println("");

		log("--- Get all languages ---");
		List<Language> languageList = controller.getLanguagesList();
		log("Got " + languageList.size() + " languages:");
		for (Language language : languageList) {
			log("id: <" + language.getLanguageId() + ">, label: <"
					+ language.getLanguageName() + ">");
		}
		log("done");

		for (Language language : languageList) {

			System.out.println("");

			log("--- Using language <" + language.getLanguageId() + "> ---");

			System.out.println("");

			log("Get education institute by id");
			for (EducationInstituteBasicInformation educationInstituteBasicInformation : eduInstBasInfList) {
				log("parameter: id: <"
						+ educationInstituteBasicInformation.getId()
						+ ">, language: <" + language.getLanguageId() + ">");
				EducationInstitute educationInstitute = controller
						.getEducationInstituteById(
						educationInstituteBasicInformation.getId(),
						language.getLanguageId());
				if(educationInstitute == null) {
					log("education institute is null");
				} else {
					log("id: <" + educationInstitute.getId() + ">, name: <"
							+ educationInstitute.getName() + ">, city: <"
							+ educationInstitute.getCity() + ">, description: <"
							+ educationInstitute.getEducationInstituteDescription()
							+ ">, email: <" + educationInstitute.getEmail()
							+ ">, latitude: <" + educationInstitute.getLatitude()
							+ ">, longitude: <" + educationInstitute.getLongitude()
							+ ">, phone: <" + educationInstitute.getPhone()
							+ ">, state: <" + educationInstitute.getState()
							+ ">, street and house number: <"
							+ educationInstitute.getStreetAndHouseNumber()
							+ ">, wikipedia hyperlink: <"
							+ educationInstitute.getWikipediaHyperlink()
							+ ">, year of foundation: <"
							+ educationInstitute.getYearOfFoundation()
							+ ">, zip code: <" + educationInstitute.getZipCode()
							+ ">");

					log("job statistic:");

					List<JobStatisticDataset> jobStatisticList = educationInstitute
							.getJobStatistic();

					for (JobStatisticDataset jsd : jobStatisticList) {
						log("job title: <" + jsd.getJobTitle() + ">, rate: <"
								+ jsd.getRate() + ">");
					}

					log("end of job statistic")

					log("alumni:");

					List<Alumnus> alumni = educationInstitute
							.getAlumni();

					for (Alumnus alumnus : alumni) {
						log("name: <" + alumnus.getAlumniName() + ">, job: <"
								+ alumnus.getJobTitle() + ">, wikipedia:<"+alumnus.getWikipediaHyperlink()+">");
					}
					log("end of alumni")

					if(!searchParameterSet) {
						String educationInstituteName = educationInstitute.getName();
						String state = educationInstitute.getState();
						String city = educationInstitute.getCity();

						if(educationInstituteName != null && !educationInstituteName.isEmpty()
						&& state != null && !state.isEmpty()
						&& city != null && !city.isEmpty()
						&& alumni != null && !alumni.isEmpty()
						&& alumni.get(0) != null
						&& alumni.get(0).getAlumniName() != null
						&& !alumni.get(0).getAlumniName().isEmpty()
						&& alumni.get(0).getJobTitle() != null
						&& !alumni.get(0).getJobTitle().isEmpty())
						{
							String alumnusName = alumni.get(0).getAlumniName();
							String jobTitle = alumni.get(0).getJobTitle();

							// set search languages static. Otherwise there would be to much datasets...
							List<String> searchLanguages = new ArrayList<String>();
							searchLanguages.add("de");
							searchLanguages.add("en");

							for(String searchLanguage : searchLanguages) {

								// Only some "typical" parameter sets to not have to much parameter sets

								search.add([state, null, null, null, null, searchLanguage]);
								search.add([null, city, null, null, null, searchLanguage]);
								search.add([null, null, educationInstituteName, null, null, searchLanguage]);
								search.add([null, null, null, alumnusName, null, searchLanguage]);
								search.add([null, null, null, null, jobTitle, searchLanguage]);
								search.add([state, city, null, null, null, searchLanguage]);
								search.add([state, city, null, null, jobTitle, searchLanguage]);
								search.add([state, city, educationInstituteName, null, null, searchLanguage]);
								search.add([state, city, educationInstituteName, alumnusName, null, searchLanguage]);
								search.add([state, city, educationInstituteName, alumnusName, jobTitle, searchLanguage]);
								search.add([state, null, educationInstituteName, null, null, searchLanguage]);
								search.add([null, city, educationInstituteName, null, null, searchLanguage]);
							}

							searchParameterSet = true;
						}

					}
				}
				log("done")

				System.out.println("");

				log("--- Get job statistic by id ---");
				for (EducationInstituteBasicInformation educationInstituteBasicInformation2 : eduInstBasInfList) {
					log("parameter: id: <"
							+ educationInstituteBasicInformation.getId()
							+ ">, language: <" + language.getLanguageId() + ">");
					List<JobStatisticDataset> jobStatisticList2 = controller
							.getJobStatisticDatasetsByEducationInstituteid(
							educationInstituteBasicInformation2.getId(),
							language.getLanguageId());
					for (JobStatisticDataset jsd : jobStatisticList2) {
						log("job title: <" + jsd.getJobTitle() + ">, rate: <"
								+ jsd.getRate() + ">");
					}
					log("done");

					System.out.println("");

					log("Get texts");
					log("Address: <" + controller.getText(GlobalDAO.TEXTID_Address, language.getLanguageId()) + ">");
					log("Alumni: <" + controller.getText(GlobalDAO.TEXTID_Alumni, language.getLanguageId()) + ">");
					log("City: <" + controller.getText(GlobalDAO.TEXTID_City, language.getLanguageId()) + ">");
					log("Education Institute: <" + controller.getText(GlobalDAO.TEXTID_Education_Institute, language.getLanguageId()) + ">");
					log("Email: <" + controller.getText(GlobalDAO.TEXTID_EMail, language.getLanguageId()) + ">");
					log("Job: <" + controller.getText(GlobalDAO.TEXTID_Job, language.getLanguageId()) + ">");
					log("Name: <" + controller.getText(GlobalDAO.TEXTID_Name, language.getLanguageId()) + ">");
					log("Person: <" + controller.getText(GlobalDAO.TEXTID_Person, language.getLanguageId()) + ">");
					log("Phone: <" + controller.getText(GlobalDAO.TEXTID_Phone, language.getLanguageId()) + ">");
					log("State: <" + controller.getText(GlobalDAO.TEXTID_State, language.getLanguageId()) + ">");
					log("Year of foundation: <" + controller.getText(GlobalDAO.TEXTID_Year_Of_Foundation, language.getLanguageId()) + ">");

				}
			}
		}

		System.out.println("");

		log("--- Test search function ---");

		System.out.println("");

		for (String[] parameters : search) {

			String search_state = parameters[0];
			String search_city = parameters[1];
			String search_educationInstitute = parameters[2];
			String search_alumnus = parameters[3];
			String search_job = parameters[4];
			String languageid = parameters[5];

			log("search parameters: search_state: <" + search_state
					+ ">, search_city: <" + search_city
					+ ">, search_educationInstitute: <"
					+ search_educationInstitute + ">, search_alumnus: <"
					+ search_alumnus + ">, search_job: <" + search_job
					+ ">, languageid: <" + languageid + ">");

			List<EducationInstitute> eduInstList = controller
					.searchEducationInstitutes(search_state, search_city,
					search_educationInstitute, search_alumnus,
					search_job, languageid);

			if(eduInstList == null || eduInstList.size() == 0) {
				log("no results");
			} else {
				log("results:")
			}

			for (EducationInstitute educationInstitute : eduInstList) {
				log("id: <" + educationInstitute.getId() + ">, name: <"
						+ educationInstitute.getName() + ">, city: <"
						+ educationInstitute.getCity() + ">, description: <"
						+ educationInstitute.getEducationInstituteDescription()
						+ ">, email: <" + educationInstitute.getEmail()
						+ ">, latitude: <" + educationInstitute.getLatitude()
						+ ">, longitude: <" + educationInstitute.getLongitude()
						+ ">, phone: <" + educationInstitute.getPhone()
						+ ">, state: <" + educationInstitute.getState()
						+ ">, street and house number: <"
						+ educationInstitute.getStreetAndHouseNumber()
						+ ">, wikipedia hyperlink: <"
						+ educationInstitute.getWikipediaHyperlink()
						+ ">, year of foundation: <"
						+ educationInstitute.getYearOfFoundation()
						+ ">, zip code: <" + educationInstitute.getZipCode()
						+ ">");

				log("job statistic:");

				List<JobStatisticDataset> jobStatisticList = educationInstitute
						.getJobStatistic();

				for (JobStatisticDataset jsd : jobStatisticList) {
					log("job title: <" + jsd.getJobTitle() + ">, rate: <"
							+ jsd.getRate() + ">");
				}
				log("end of job statistic")


				log("alumni:");

				List<Alumnus> alumni = educationInstitute
						.getAlumni();

				for (Alumnus alumnus : alumni) {
					log("name: <" + alumnus.getAlumniName() + ">, job: <"
							+ alumnus.getJobTitle() + ">, wikipedia:<"+alumnus.getWikipediaHyperlink()+">");
				}

				log("end of alumni");
				log("end of results");
			}
			System.out.println("");
		}

		log("done");
	}

	private static String getTimestamp() {
		return "[" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss:SSS").format(new Date()) + "]";
	}

	private static void log(String string) {
		System.out.println(getTimestamp() + " " + string);
	}

}