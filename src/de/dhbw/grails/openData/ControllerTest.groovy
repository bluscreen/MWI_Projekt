/**
 * 
 */
package de.dhbw.grails.openData

import org.apache.commons.logging.LogFactory

import de.dhbw.grails.openData.controller.Controller
import de.dhbw.grails.openData.controller.datatype.Alumnus
import de.dhbw.grails.openData.controller.datatype.EducationInstitute
import de.dhbw.grails.openData.controller.datatype.EducationInstituteBasicInformation
import de.dhbw.grails.openData.controller.datatype.JobStatisticDataset
import de.dhbw.grails.openData.controller.datatype.Language



/**
 * Test class for testing the controller functionality using a real database
 * 
 * Why a static main method and not a unit test?
 * - it is possible to see the performance of program parts
 * - this test depends on real data and not on mock data
 * - the used data (e. g. for the search functionality) are not static (in some parts) but real data
 */
public class ControllerTest {

	private static final log = LogFactory.getLog(this)

	/**
	 *  TODO [DH] Bitte hier zusammenfassend dokumentieren, was im Test alles getestet wird
	 *   und wie die Testsequenzen im Einzelnen aufgebaut sind, um dies sicher zu stellen
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		// List of search parameter sets
		List<String[]> search = new ArrayList<String[]>()
		// TODO [DH] Bitte einen Dummy Header für die Liste erzeugen, oder Bezug erwähnen
		search.add([
			null,
			null,
			null,
			null,
			null,
			null
		])
		search.add([
			null,
			null,
			null,
			null,
			null,
			"de"
		])
		search.add([
			"BLABLABLA##123",
			null,
			null,
			null,
			null,
			"de"
		])
		search.add([
			null,
			"BLABLABLA##123",
			null,
			null,
			null,
			"de"
		])
		search.add([
			null,
			null,
			"BLABLABLA##123",
			null,
			null,
			"de"
		])
		search.add([
			null,
			null,
			null,
			"BLABLABLA##123",
			null,
			"de"
		])
		search.add([
			null,
			null,
			null,
			null,
			"BLABLABLA##123",
			"de"
		])

		// to know whether the parameters are set
		boolean searchParameterSet = false

		log.info "--- Start test ---"
		log.info "--- Get controller instance ---"
		Controller controller = new Controller()
		log.info "done"

		log.info "--- Get all education institutes ---"
		List<EducationInstituteBasicInformation> eduInstBasInfList = controller
				.getAllEducationInstitutes()
		log.info "Got " + eduInstBasInfList.size() + " objects:"
		for (EducationInstituteBasicInformation educationInstituteBasicInformation : eduInstBasInfList) {
			log.info ("id: <" + educationInstituteBasicInformation.getId()
					+ ">, latitude: <"
					+ educationInstituteBasicInformation.getLatitude()
					+ ">, longitude: <"
					+ educationInstituteBasicInformation.getLongitude() + ">")
		}
		log.info "done"

		log.info "--- Get all languages ---"
		List<Language> languageList = controller.getLanguagesList()
		log.info "Got " + languageList.size() + " languages:"
		for (Language language : languageList) {
			log.info("id: <" + language.getLanguageId() + ">, label: <"
					+ language.getLanguageName() + ">")
		}
		log.info "done"

		for (Language language : languageList) {

			log.info "--- Using language <" + language.getLanguageId() + "> ---"
			log.info "Get education institute by id"
			for (EducationInstituteBasicInformation educationInstituteBasicInformation : eduInstBasInfList) {
				log.info "parameter: id: <"
				+ educationInstituteBasicInformation.getId()
				+ ">, language: <" + language.getLanguageId() + ">"
				EducationInstitute educationInstitute = controller
						.getEducationInstituteById(
						educationInstituteBasicInformation.getId(),
						language.getLanguageId())
				if(educationInstitute == null) {
					log.info "education institute is null"
				} else {
					log.info("id: <" + educationInstitute.getId() + ">, name: <"
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
							+ ">")

					log.info "job statistic:"

					List<JobStatisticDataset> jobStatisticList = educationInstitute
							.getJobStatistic()

					for (JobStatisticDataset jsd : jobStatisticList) {
						log.info("job title: <" + jsd.getJobTitle() + ">, rate: <"
								+ jsd.getRate() + ">")
					}

					log.info "end of job statistic"

					log.info "alumni:"

					List<Alumnus> alumni = educationInstitute
							.getAlumni()

					for (Alumnus alumnus : alumni) {
						log.info("name: <" + alumnus.getAlumniName() + ">, job: <"
								+ alumnus.getJobTitle() + ">, wikipedia:<"+alumnus.getWikipediaHyperlink()+">")
					}
					log.info "end of alumni"

					if(!searchParameterSet) {
						String educationInstituteName = educationInstitute.getName()
						String state = educationInstitute.getState()
						String city = educationInstitute.getCity()

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
							String alumnusName = alumni.get(0).getAlumniName()
							String jobTitle = alumni.get(0).getJobTitle()

							// set search languages static. Otherwise there would be to much datasets...
							List<String> searchLanguages = new ArrayList<String>()
							searchLanguages.add("de")
							searchLanguages.add("en")

							for(String searchLanguage : searchLanguages) {

								// Only some "typical" parameter sets to not have to much parameter sets
								search.add([
									state,
									null,
									null,
									null,
									null,
									language
								])
								search.add([
									null,
									city,
									null,
									null,
									null,
									language
								])
								search.add([
									null,
									null,
									educationInstituteName,
									null,
									null,
									language
								])
								search.add([
									null,
									null,
									null,
									alumnusName,
									null,
									language
								])
								search.add([
									null,
									null,
									null,
									null,
									jobTitle,
									language
								])
								search.add([
									state,
									city,
									null,
									null,
									null,
									language
								])
								search.add([
									state,
									city,
									null,
									null,
									jobTitle,
									language
								])
								search.add([
									state,
									city,
									educationInstituteName,
									null,
									null,
									language
								])
								search.add([
									state,
									city,
									educationInstituteName,
									alumnusName,
									null,
									language
								])
								search.add([
									state,
									city,
									educationInstituteName,
									alumnusName,
									jobTitle,
									language
								])
								search.add([
									state,
									null,
									educationInstituteName,
									null,
									null,
									language
								])
								search.add([
									null,
									city,
									educationInstituteName,
									null,
									null,
									language
								])
							}

							searchParameterSet = true
						}

					}
				}
				log.info "done"

				log.info "--- Get job statistic by id ---"
				for (EducationInstituteBasicInformation educationInstituteBasicInformation2 : eduInstBasInfList) {
					log.info("parameter: id: <"
							+ educationInstituteBasicInformation.getId()
							+ ">, language: <" + language.getLanguageId() + ">")

					List<JobStatisticDataset> jobStatisticList2 = controller
							.getJobStatisticDatasetsByEducationInstituteid(
							educationInstituteBasicInformation2.getId(),
							language.getLanguageId())
					for (JobStatisticDataset jsd : jobStatisticList2) {
						log.info("job title: <" + jsd.getJobTitle() + ">, rate: <"
								+ jsd.getRate() + ">")
					}
					log.info "done"

					log.info "Get texts"
					log.info "Address: <" + controller.getText(Controller.TEXTID_Address, language.getLanguageId()) + ">"
					log.info "Alumni: <" + controller.getText(Controller.TEXTID_Alumni, language.getLanguageId()) + ">"
					log.info "City: <" + controller.getText(Controller.TEXTID_City, language.getLanguageId()) + ">"
					log.info "Education Institute: <" + controller.getText(Controller.TEXTID_Education_Institute, language.getLanguageId()) + ">"
					log.info "Email: <" + controller.getText(Controller.TEXTID_EMail, language.getLanguageId()) + ">"
					log.info "Job: <" + controller.getText(Controller.TEXTID_Job, language.getLanguageId()) + ">"
					log.info "Name: <" + controller.getText(Controller.TEXTID_Name, language.getLanguageId()) + ">"
					log.info "Person: <" + controller.getText(Controller.TEXTID_Person, language.getLanguageId()) + ">"
					log.info "Phone: <" + controller.getText(Controller.TEXTID_Phone, language.getLanguageId()) + ">"
					log.info "State: <" + controller.getText(Controller.TEXTID_State, language.getLanguageId()) + ">"
					log.info "Year of foundation: <" + controller.getText(Controller.TEXTID_Year_Of_Foundation, language.getLanguageId()) + ">"

				}
			}
		}

		log.info "--- Test search function ---"

		for (String[] parameters : search) {

			String search_state = parameters[0]
			String search_city = parameters[1]
			String search_educationInstitute = parameters[2]
			String search_alumnus = parameters[3]
			String search_job = parameters[4]
			String languageid = parameters[5]

			log.info ("search parameters: search_state: <" + search_state
					+ ">, search_city: <" + search_city
					+ ">, search_educationInstitute: <"
					+ search_educationInstitute + ">, search_alumnus: <"
					+ search_alumnus + ">, search_job: <" + search_job
					+ ">, languageid: <" + languageid + ">")

			List<EducationInstitute> eduInstList = controller
					.searchEducationInstitutes(search_state, search_city,
					search_educationInstitute, search_alumnus,
					search_job, languageid)

			if(eduInstList == null || eduInstList.size() == 0) {
				log.info "no results"
			} else {
				log.info "results:"
			}

			for (EducationInstitute educationInstitute : eduInstList) {
				log.info("id: <" + educationInstitute.getId() + ">, name: <"
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
						+ ">")

				log.info "job statistic:"

				List<JobStatisticDataset> jobStatisticList = educationInstitute
						.getJobStatistic()

				for (JobStatisticDataset jsd : jobStatisticList) {
					log.info("job title: <" + jsd.getJobTitle() + ">, rate: <"
							+ jsd.getRate() + ">")
				}
				log.info "end of job statistic"

				log.info "alumni:"

				List<Alumnus> alumni = educationInstitute.getAlumni()

				for (Alumnus alumnus : alumni) {
					log.info("name: <" + alumnus.getAlumniName() + ">, job: <"
							+ alumnus.getJobTitle() + ">, wikipedia:<"+alumnus.getWikipediaHyperlink()+">")
				}

				log.info "end of alumni"
				log.info "end of results"
			}
		}
		log.info "done"
	}
}
