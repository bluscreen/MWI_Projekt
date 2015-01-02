package de.dhbw.grails.openData;



/**
 * Class for storing a dataset of a language, containing a language name and the corresponding language id
 */
public class Language {

	private String languageName
	private String languageId
	
	@Override
	public String toString() {
		return languageId + ":" + languageName
	}

}

