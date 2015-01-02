package de.dhbw.grails.openData

class IndexController {

	
	def index() {
		log.info "index() called"
		[doener: GlobalDAO.instance.checkIT() ]
//		[doener: GlobalDAO.instance.getLanguagesList() ]
	}

	def popup() {
		[doener:["1", "doener"]]
	}
}
