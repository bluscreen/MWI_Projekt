package de.dhbw.grails.openData

class IndexController {

	
	def index() {

		log.info "index() called"
		//		def doenerer = SpecialController.instance
		//		[ doener: doenerer.getAllEducationInstitutes() ]
		
		
//		log.info SingleTestor.instance
		
		log.info GlobalDAO.instance.checkIT()
		

		[doener: GlobalDAO.instance.getLanguagesList() ]
	}

	def popup() {
		[doener:["1", "doener"]]
	}
}
