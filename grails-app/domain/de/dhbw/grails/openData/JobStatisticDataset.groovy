package de.dhbw.grails.openData;


/**
 * @author Raffaela F., Benny R.
 * 
 * Class for storing a dataset of job statistic of an educational institute
 */
public class JobStatisticDataset {

	private String jobTitle;
	private int number;

	public JobStatisticDataset(String jobTitle, int number) {
		this.jobTitle = jobTitle;
		this.number = number;
	}

	@Override
	public String toString() {
		return ("JobStatisticDataset [jobTitle=" + jobTitle + ", number="
				+ number + "]");
	}
	
	
}