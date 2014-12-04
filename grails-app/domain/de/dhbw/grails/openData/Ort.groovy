package de.dhbw.grails.openData

class Ort {
	String language
	
	String name
	String postleitzahl
	
	String laengengrad
	String breitengrad
	
	Staat staat

	static belongsTo = Staat
	
	static hasMany=[bildungseinrichtungen:Bildungseinrichtung]

	static constraints = {
		name(blank:false, nullable:false, size:2..40)
		staat(nullable:false)
		laengengrad(blank:false, nullable:false)
		breitengrad(blank:false, nullable:false)
		postleitzahl(nullable:true)
		language(nullable:true)
	}

	String toString(){
		name
	}
}
