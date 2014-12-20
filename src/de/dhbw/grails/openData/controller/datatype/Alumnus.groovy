package de.dhbw.grails.openData.controller.datatype;


/**
 * Class for storing details about one alumnus
 */
public class Alumnus {
	
	private String alumniName, jobTitle, wikipediaHyperlink;
	
	public Alumnus(String alumniName, String jobTitle, String wikipediaHyperlink) {
		this.alumniName = alumniName;
		this.jobTitle = jobTitle;
		this.wikipediaHyperlink = wikipediaHyperlink;
	}
	

	/**
	 * @return this alumnus name
	 */
	public String getAlumniName() {
		return alumniName;
	}
	
	/**
	 * @return the title of this alumnus job
	 */
	public String getJobTitle() {
		return jobTitle;
	}
	
	/**
	 * @return the URL of the corresponding Wikipedia article of this alumnus as String
	 */
	public String getWikipediaHyperlink() {
		return wikipediaHyperlink;
	}
}