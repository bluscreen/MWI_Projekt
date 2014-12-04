package de.dhbw.grails.openData
/**
 * @author dhammacher
 *
 */
class Abschluss {
	String language
	
	String thema
	String titel
	String note
	Date abschlussdatum
	
	Person person
	Bildungseinrichtung bildungseinrichtung
	
	static belongsTo = [Person, Bildungseinrichtung]

    static constraints = {
		bildungseinrichtung(nullable:false)
		person(nullable:false)
		language(nullable:true)
    }
	
	String toString() {
		titel
	}
}
