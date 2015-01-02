package de.dhbw.grails.openData

@Singleton
class SingleTestor {
	def x= new Date()
	def y = Math.random()

	def bla() {
		return [x, y]
	}

	String toString() {
		return "x " + x + "   lalala  " + y
	}
}
