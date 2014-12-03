package de.dhbw.grails.openData

class Person {
	def language
	String nachname
	String vorname
	Date geburtsdatum
	
	// uns interessiert nur ein beruf...
	Beruf beruf
	static hasMany=[abschluesse:Abschluss]
	
    static constraints = {
		nachname(blank:false, nullable: false, size:2..40)
		vorname(blank:false, nullable: false, size:2..40)
		beruf(nullable:true)
    }
}
