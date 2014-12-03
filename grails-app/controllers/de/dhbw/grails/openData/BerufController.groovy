package de.dhbw.grails.openData



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BerufController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Beruf.list(params), model:[berufInstanceCount: Beruf.count()]
    }

    def show(Beruf berufInstance) {
        respond berufInstance
    }

    def create() {
        respond new Beruf(params)
    }

    @Transactional
    def save(Beruf berufInstance) {
        if (berufInstance == null) {
            notFound()
            return
        }

        if (berufInstance.hasErrors()) {
            respond berufInstance.errors, view:'create'
            return
        }

        berufInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'beruf.label', default: 'Beruf'), berufInstance.id])
                redirect berufInstance
            }
            '*' { respond berufInstance, [status: CREATED] }
        }
    }

    def edit(Beruf berufInstance) {
        respond berufInstance
    }

    @Transactional
    def update(Beruf berufInstance) {
        if (berufInstance == null) {
            notFound()
            return
        }

        if (berufInstance.hasErrors()) {
            respond berufInstance.errors, view:'edit'
            return
        }

        berufInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Beruf.label', default: 'Beruf'), berufInstance.id])
                redirect berufInstance
            }
            '*'{ respond berufInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Beruf berufInstance) {

        if (berufInstance == null) {
            notFound()
            return
        }

        berufInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Beruf.label', default: 'Beruf'), berufInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'beruf.label', default: 'Beruf'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
