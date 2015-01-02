package de.dhbw.grails.openData;


/**
 * Class for storing detailed information about an education institute
 */
public class EducationInstitute extends EducationInstituteBasicInformation {

	private final String name, state, city, zipCode, streetAndHouseNumber,
	phone, email, yearOfFoundation, educationInstituteDescription,
	wikipediaHyperlink;
	private List<JobStatisticDataset> jobStatisticList;
	private List<Alumnus> alumnusList;

	public EducationInstitute(double longitude, double latitude, String id,
	String name, String state, String city, String zipCode,
	String streetAndHouseNumber, String phone, String email,
	String yearOfFoundation, String educationInstituteDescription,
	String wikipediaHyperlink, List<JobStatisticDataset> jobStatisticList, List<Alumnus> alumnusList) {
		super(longitude, latitude, id);
		this.name = name;
		this.state = state;
		this.city = city;
		this.zipCode = zipCode;
		this.streetAndHouseNumber = streetAndHouseNumber;
		this.phone = phone;
		this.yearOfFoundation = yearOfFoundation;
		this.educationInstituteDescription = educationInstituteDescription;
		this.wikipediaHyperlink = wikipediaHyperlink;
		this.email = email;
		this.jobStatisticList = jobStatisticList;
		this.alumnusList = alumnusList;
	}

	/**
	 * @return the name of this education institute as String
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return the state of this education institute as String
	 */
	public String getState() {
		return state;
	}

	/**
	 * @return the city of this education institute as String
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @return the zip code of this education institute as String
	 */
	public String getZipCode() {
		return zipCode;
	}

	/**
	 * @return the street name and house number of this education institute as
	 *         String
	 */
	public String getStreetAndHouseNumber() {
		return streetAndHouseNumber;
	}

	/**
	 * @return the phone number of this education institute as String
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @return the email of this education institute as String
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return the year of foundation of this education institute as String
	 */
	public String getYearOfFoundation() {
		return yearOfFoundation;
	}

	/**
	 * @return the short description of this education institute as String
	 */
	public String getEducationInstituteDescription() {
		return educationInstituteDescription;
	}

	/**
	 * @return the wikipedia hyperlink of this education institute as String
	 */
	public String getWikipediaHyperlink() {
		return wikipediaHyperlink;
	}

	/**
	 * @return the list of job statistics of this education institute
	 */
	public List<JobStatisticDataset> getJobStatistic() {
		return jobStatisticList;
	}

	/**
	 * @return the list of alumni of this education institute as String
	 */
	public List<Alumnus> getAlumni() {
		return alumnusList;
	}
}
