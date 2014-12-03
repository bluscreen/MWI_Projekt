package de.dhbw.grails.openData
/**
 * @author dhammacher
 *
 */
class Abschluss {
	def language
	
	String thema
	String titel
	Date abschlussdatum
	String note
	
	Person person
	Bildungseinrichtung bildungseinrichtung
	
	static belongsTo = [Person, Bildungseinrichtung]

    static constraints = {
		bildungseinrichtung(nullable:false)
		person(nullable:false)
    }
}
