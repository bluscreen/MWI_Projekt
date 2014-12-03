package de.dhbw.grails.openData
/**
 * 
 * blah
 * @author dhammacher
 *
 */
class Abschluss {
	// TODO TBD
	def language
	String thema
	String titel
	Date abschlussdatum
	String note
	Person person
	
	Bildungseinrichtung bildungseinrichtung

    static constraints = {
		bildungseinrichtung(nullable:false)
    }
}
