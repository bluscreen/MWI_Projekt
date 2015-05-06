package de.dhbw.grails.openData;


/**
 * @author Raffaela F., Benny R.
 *
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

	@Override
	public String toString() {
		return ("EducationInstitute [name=" + name + ", state=" + state
				+ ", city=" + city + ", zipCode=" + zipCode
				+ ", streetAndHouseNumber=" + streetAndHouseNumber + ", phone="
				+ phone + ", email=" + email + ", yearOfFoundation="
				+ yearOfFoundation + ", educationInstituteDescription="
				+ educationInstituteDescription + ", wikipediaHyperlink="
				+ wikipediaHyperlink + ", jobStatisticList=" + jobStatisticList
				+ ", alumnusList=" + alumnusList + "]")
	}
	
	
}