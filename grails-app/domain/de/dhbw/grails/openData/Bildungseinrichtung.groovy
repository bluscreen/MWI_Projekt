package de.dhbw.grails.openData

class Bildungseinrichtung {
	String language
	
	String name
	String email
	String webpage
	
	String laengengrad
	String breitengrad
	
	Ort ort

	static belongsTo = Ort 
	
	static hasMany=[alumni:Person, abschluesse:Abschluss]

	static constraints = {
		name(blank:false, nullable: false, size:2..40)
		ort(nullable:false)
		email(email:true, nullable:true)
		webpage(url:true, nullable:true)
		laengengrad(nullable:true)
		breitengrad(nullable:true)
		language(nullable:true)
	}

	String toString() {
		name
	}
}
