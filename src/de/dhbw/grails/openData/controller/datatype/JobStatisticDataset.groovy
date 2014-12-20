package de.dhbw.grails.openData.controller.datatype;


/**
 * Class for storing a dataset of job statistic of an educational institute
 */
public class JobStatisticDataset {

	private String jobTitle;
	private int number, total;
	private double rate;

	public JobStatisticDataset(String jobTitle, int number) {
		this.jobTitle = jobTitle;
		this.number = number;
		this.total = 0;
		this.rate = -1;
	}

	/**
	 * 
	 * @param total the total number 
	 * @throws IllegalArgumentException
	 */
	public void setTotal(int total) {
		if(total >= number) {
			this.total = total;
			this.rate = adjustRate(number / total)*100;
		} else {
			throw new IllegalArgumentException();
		}
	}

	private double adjustRate(double rate) {
		if(rate < 0) {
			rate = 0;
		}
		if(rate > 100) {
			rate = 100;
		}

		return rate;
	}

	/**
	 * @return the job title 
	 */
	public String getJobTitle() {
		return jobTitle;
	}

	/**
	 * @return the rate of this job in percent (e. g. 20.1415)
	 */
	public double getRate() {
		return rate;
	}
}
