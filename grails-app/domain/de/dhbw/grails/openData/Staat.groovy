package de.dhbw.grails.openData

class Staat {
	def language
	String name
	String tld

	static hasMany=[orte:Ort]
	
	def laengengrad
	def breitengrad

	static constraints = {
		name(blank:false, nullable: false, size:2..40)
		laengengrad(blank:false, nullable:false)
		breitengrad(blank:false, nullable:false)
		tld(nullable:true)
	}
	
	String toString(){
		name
	}
}
