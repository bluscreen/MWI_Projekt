package de.dhbw.grails.openData;


/**
 * @author Raffaela F., Benny R.
 *
 * Class for storing a dataset of a language, containing a language name and the corresponding language id
 */
public class Language implements Comparable<Language> {

	private String languageName;
	private String languageId;

	public Language(String languageId, String languageName) {
		this.languageId = languageId;
		this.languageName = languageName;
	}

	/**
	 * @return the name of this language
	 */
	public String getLanguageName() {
		return languageName;
	}

	/**
	 * @return the id of this language. This id is needed for requesting texts in this language.
	 */
	public String getLanguageId() {
		return languageId;
	}

	@Override
	public String toString() {
		return "Language [languageName=" + languageName + ", languageId="
				+ languageId + "]";
	}
	
	public int compareTo(Language other){
		return languageName.compareTo(other.languageName)
	}
	
	
}
