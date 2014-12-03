package de.dhbw.grails.openData

class Bildungseinrichtung {
	def language
	String name
	Ort ort
	String email
	String webpage
	def laengengrad
	def breitengrad
	

	static hasMany=[alumni:Person]

	static constraints = {
		name(blank:false, nullable: false, size:2..40)
		ort(nullable:false)
		email(email:true, nullable:true)
		webpage(url:true, nullable:true)
		laengengrad(nullable:true)
		breitengrad(nullable:true)
	}

	String toString() {
		name
	}
}
