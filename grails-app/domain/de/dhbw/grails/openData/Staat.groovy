package de.dhbw.grails.openData

class Staat {
	String language
	String name

	String laengengrad
	String breitengrad

	static hasMany=[orte:Ort]
	
	static constraints = {
		name(blank:false, nullable: false, size:2..40)
		laengengrad(blank:false, nullable:false)
		breitengrad(blank:false, nullable:false)
		language(nullable:true)
	}
	
	String toString(){
		name
	}
}
