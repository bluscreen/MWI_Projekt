package de.dhbw.grails.openData

class Beruf {
	
	//bla
	def language
	String name
	String firma
	
    static constraints = {
		name(blank:false, nullable: false, size:2..40)
    }
}
