import de.dhbw.grails.openData.Abschluss
import de.dhbw.grails.openData.Beruf
import de.dhbw.grails.openData.Bildungseinrichtung
import de.dhbw.grails.openData.Ort
import de.dhbw.grails.openData.Person
import de.dhbw.grails.openData.Staat

class BootStrap {

	def init = { servletContext ->
		Staat deutschland = new Staat(name:'Deutschland', laengengrad: '51.5167', breitengrad:'9.9167')
		if(!deutschland.save()) {
			log.error("Deutschland ist kaputt")
			log.error("${deutschland.errors}")
		}
		Ort karlsruhe = new Ort(name:'Karlsruhe', laengengrad: '49.0158491', breitengrad: '8.4095339', staat:deutschland)
		if(!karlsruhe.save()) {
			log.error("Karlsruhe ist kaputt")
			log.error("${karlsruhe.errors}")
		}
		Bildungseinrichtung dhbw = new Bildungseinrichtung(name:'DHBW Karlsruhe', laengengrad: '49.026461', breitengrad: '8.385757', ort:karlsruhe)
		if(!dhbw.save()) {
			log.error("DHBW ist kaputt")
			log.error("${dhbw.errors}")
		}
		Beruf beruf = new Beruf(name:'Doenermann')
		if(!beruf.save()){
			log.error("doener KAPOTT!!!")
			log.error("${beruf.errors}")
		}
		
		Person mensch = new Person(
			nachname:'Musterbird', 
			vorname:'Maya', 
			geburtsdatum: new Date(1984,11,23),
			beruf: beruf
		)
		
		if(!mensch.save()){
			log.error("MENSCH KAPOTT!!!")
			log.error("${mensch.errors}")
		}
		
		Abschluss abschluss = new Abschluss(
				abschlussdatum: new Date(),
				thema:'Doenologie',
				titel:'BSC',
				note:'1',
				bildungseinrichtung:dhbw,
				person: mensch
		)
		
		if(!abschluss.save()){
			log.error("Abschluss KAPOTT!!!")
			log.error("${abschluss.errors}")
		}
		
	}
	def destroy = {
	}
}
