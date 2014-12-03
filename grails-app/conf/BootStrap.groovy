import de.dhbw.grails.openData.Abschluss
import de.dhbw.grails.openData.Beruf
import de.dhbw.grails.openData.Bildungseinrichtung
import de.dhbw.grails.openData.Ort
import de.dhbw.grails.openData.Person
import de.dhbw.grails.openData.Staat

class BootStrap {

	def init = { servletContext ->
//		Staat deutschland = new Staat(name:'Deutschland', laengengrad: '10', breitengrad:'20')
//		if(!deutschland.save()) {
//			log.error("Deutschland ist kaputt")
//			log.error("${deutschland.errors}")
//		}
//		Ort karlsruhe = new Ort(name:'Karlsruhe', laengengrad: '11', breitengrad: '20', staat:deutschland)
//		if(!karlsruhe.save()) {
//			log.error("Karlsruhe ist kaputt")
//			log.error("${karlsruhe.errors}")
//		}
//		Bildungseinrichtung dhbw = new Bildungseinrichtung(name:'DHBW Karlsruhe', ort:karlsruhe)
//		if(!dhbw.save()) {
//			log.error("DHBW ist kaputt")
//			log.error("${dhbw.errors}")
//		}
//		Person mensch = new Person(nachname:'Mustermann', vorname:'Maya')
//		Beruf doenermann = new Beruf(name:'Doenermann')
//		if(!doenermann.save()) {
//			log.error("Doener kaputt")
//		}
//		mensch.beruf = doenermann
//
//		Abschluss abschluss = new Abschluss(abschlussdatum: new Date(), thema:'Doenologie',titel:'BSC',note:'1', bildungseinrichtung:dhbw, person:mensch)
//		if(!abschluss.save())
//		{
//			log.error("Doenologie kaputt")
//		}
//		mensch.abschluesse = { abschluss }
//		
//		if(!mensch.save()){
//			log.error("MENSCH KAPOTT!!!")
//		}
		
	}
	def destroy = {
	}
}
