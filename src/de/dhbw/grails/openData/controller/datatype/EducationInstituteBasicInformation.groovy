package de.dhbw.grails.openData.controller.datatype;


/**
 * Class for storing the most basical information about an education institute
 */
public class EducationInstituteBasicInformation {

	private double longitude, latitude;
	private String id;

	public EducationInstituteBasicInformation(double longitude, double latitude, String id) {
		this.longitude = longitude;
		this.latitude = latitude;
		this.id = id;
	}

	/**
	 * @return the longitude of this education institute
	 */
	public double getLongitude() {
		return longitude;
	}

	/**
	 * @return the latitude of this education institute
	 */
	public double getLatitude() {
		return latitude;
	}

	/**
	 * @return the id of this education institute
	 */
	public String getId() {
		return id;
	}
}
