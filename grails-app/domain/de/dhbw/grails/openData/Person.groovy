package de.dhbw.grails.openData

class Person {
	def language
	
	String nachname
	String vorname
	Date geburtsdatum
	
	Beruf beruf
	
	static belongsTo = Beruf
	
	static hasMany=[abschluesse:Abschluss]
	
    static constraints = {
		nachname(blank:false, nullable: false, size:2..40)
		vorname(blank:false, nullable: false, size:2..40)
		beruf(nullable:true)
    }
}
