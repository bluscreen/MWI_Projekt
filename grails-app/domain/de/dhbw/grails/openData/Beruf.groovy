package de.dhbw.grails.openData

class Beruf {
	String language
	
	String name
	String firma
	
	static hasMany = [personen:Person]
	
    static constraints = {
		name(blank:false, nullable: false, size:2..40)
		firma(nullable:true)
		language(nullable:true)
    }
	
	String toString() {
		name
	}
}
