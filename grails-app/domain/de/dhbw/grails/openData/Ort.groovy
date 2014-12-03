package de.dhbw.grails.openData

class Ort {
	def language
	String name
	String postleitzahl
	Staat staat

	// TODO TBD
	def laengengrad
	def breitengrad

	static hasMany=[bildungseinrichtungen:Bildungseinrichtung]

	static constraints = {
		name(blank:false, nullable:false, size:2..40)
		staat(nullable:false)
		laengengrad(blank:false, nullable:false)
		breitengrad(blank:false, nullable:false)
		postleitzahl(nullable:true)
	}

	String toString(){
		name
	}
}
