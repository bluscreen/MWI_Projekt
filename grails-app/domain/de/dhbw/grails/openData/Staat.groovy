package de.dhbw.grails.openData

class Staat {
	def language
	String name

	def laengengrad
	def breitengrad

	static hasMany=[orte:Ort]
	
	static constraints = {
		name(blank:false, nullable: false, size:2..40)
		laengengrad(blank:false, nullable:false)
		breitengrad(blank:false, nullable:false)
	}
	
	String toString(){
		name
	}
}
