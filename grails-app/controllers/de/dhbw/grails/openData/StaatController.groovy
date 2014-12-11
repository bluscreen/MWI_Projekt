package de.dhbw.grails.openData



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StaatController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Staat.list(params), model:[staatInstanceCount: Staat.count()]
    }

    def show(Staat staatInstance) {
        respond staatInstance
    }
	
	def popup()
	{
		
	}

    def create() {
        respond new Staat(params)
    }

    @Transactional
    def save(Staat staatInstance) {
        if (staatInstance == null) {
            notFound()
            return
        }

        if (staatInstance.hasErrors()) {
            respond staatInstance.errors, view:'create'
            return
        }

        staatInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'staat.label', default: 'Staat'), staatInstance.id])
                redirect staatInstance
            }
            '*' { respond staatInstance, [status: CREATED] }
        }
    }

    def edit(Staat staatInstance) {
        respond staatInstance
    }

    @Transactional
    def update(Staat staatInstance) {
        if (staatInstance == null) {
            notFound()
            return
        }

        if (staatInstance.hasErrors()) {
            respond staatInstance.errors, view:'edit'
            return
        }

        staatInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Staat.label', default: 'Staat'), staatInstance.id])
                redirect staatInstance
            }
            '*'{ respond staatInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Staat staatInstance) {

        if (staatInstance == null) {
            notFound()
            return
        }

        staatInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Staat.label', default: 'Staat'), staatInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'staat.label', default: 'Staat'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
