package de.dhbw.grails.openData

import org.springframework.web.servlet.support.RequestContextUtils


/**
 * @author dhammacher
 * UI presenter class for providing data from the GlobalDAO to the UI
 *
 */
class IndexController {

	/**
	 * main method to provide the view with search results
	 * @return
	 */
	def index() {
		log.info "index() called"

		if(session.getAttribute("systemLanguage") == null || session.getAttribute("systemLanguage") == "") {
			log.debug "systemLanguage is null or empty: call updateLanguage to try to determine it"
			updateLanguage()
		}
		log.debug "system language:" + session.getAttribute("systemLanguage")

		// Look if no search parameters are set
		boolean searchAll = (session.getAttribute("s_staat") == null || session.getAttribute("s_staat") == "") && (session.getAttribute("s_ort") == null || session.getAttribute("s_ort") == "") && (session.getAttribute("s_bildungseinrichtung") == null || session.getAttribute("s_bildungseinrichtung") == "") && (session.getAttribute("s_person") == null || session.getAttribute("s_person") == "") && (session.getAttribute("s_beruf") == null || session.getAttribute("s_beruf") == "")

		def searchResult
		if(searchAll) {
			// user is here for the first time
			searchResult = GlobalDAO.instance.getAllEducationInstitutes()
		}
		else {
			// user entered search param(s)
			searchResult = GlobalDAO.instance.searchEducationInstitutes(
					session.getAttribute("s_staat"),
					session.getAttribute("s_ort"),
					session.getAttribute("s_bildungseinrichtung"),
					session.getAttribute("s_person") ,
					session.getAttribute("s_beruf"),
					session.getAttribute("systemLanguage"))
		}

		log.info "search returned " + searchResult.size() + " results, printing:"
		searchResult.each {i->
			log.info "__" + i
		}

		[languages: GlobalDAO.instance.getLanguagesList(),
			labels: GlobalDAO.instance,
			institutes: searchResult ]
	}

	/**
	 * AJAX Method to update system language stored in session
	 * trigger = selectbox
	 * @return
	 */
	def updateLanguage() {
		log.info "updateLanguage() called"
		def locale = RequestContextUtils.getLocale(request)
		log.info "spring determined language: " + locale.getLanguage()
		if(params['lang'] == null || params['lang' == ""]) {
			GlobalDAO.instance.getLanguagesList().each {i->
				log.debug i.getLanguageId()
				if(i.getLanguageId()==locale.getLanguage()){
					session.setAttribute("systemLanguage", i.getLanguageId())
				}
			}
		}
		else{
			session.setAttribute("systemLanguage", params['lang'])
		}
		log.info "session language:" + session.getAttribute("systemLanguage")
	}

	/**
	 * AJAX Method to update search params stored in session
	 * trigger = each param
	 * @return
	 */

	def updateSearchParam() {
		log.info "updateSearchParam() called"
		log.info "param staat: " + params['staat']
		log.info "param ort: " + params['ort']
		log.info "param bildungseinrichtung: " + params['bildungseinrichtung']
		log.info "param person: " + params['person']
		log.info "param beruf: " + params['beruf']

		if(params['staat'] != null) {
			session.setAttribute("s_staat", params['staat'])
		}
		if(params['ort'] != null) {
			session.setAttribute("s_ort", params['ort'])
		}
		if(params['bildungseinrichtung'] != null){
			session.setAttribute("s_bildungseinrichtung", params['bildungseinrichtung'])
		}
		if(params['person'] != null){
			session.setAttribute("s_person", params['person'])
		}
		if(params['beruf'] != null){
			session.setAttribute("s_beruf", params['beruf'])
		}
	}

	def popup() {
		log.info "popup() called"

		def id = params['id']

		log.info "params:"
		params.each {i->
			log.info "__"+ i
		}

		if(id == null){
			id=1;
		}

		[educationInstitute: GlobalDAO.instance.getEducationInstituteById(id, session.getAttribute("systemLanguage")),
			jobStatistics: GlobalDAO.instance.getJobStatisticDatasetsByEducationInstituteid(id, session.getAttribute("systemLanguage"))]
	}
}
