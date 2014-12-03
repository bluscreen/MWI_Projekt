package de.dhbw.grails.openData

class Beruf {
	def language
	
	String name
	String firma
	
	static hasMany = [personen:Person]
	
    static constraints = {
		name(blank:false, nullable: false, size:2..40)
    }
}
