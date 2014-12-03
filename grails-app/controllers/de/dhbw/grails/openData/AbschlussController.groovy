package de.dhbw.grails.openData


// test2
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AbschlussController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Abschluss.list(params), model:[abschlussInstanceCount: Abschluss.count()]
    }

    def show(Abschluss abschlussInstance) {
        respond abschlussInstance
    }

    def create() {
        respond new Abschluss(params)
    }

    @Transactional
    def save(Abschluss abschlussInstance) {
        if (abschlussInstance == null) {
            notFound()
            return
        }

        if (abschlussInstance.hasErrors()) {
            respond abschlussInstance.errors, view:'create'
            return
        }

        abschlussInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'abschluss.label', default: 'Abschluss'), abschlussInstance.id])
                redirect abschlussInstance
            }
            '*' { respond abschlussInstance, [status: CREATED] }
        }
    }

    def edit(Abschluss abschlussInstance) {
        respond abschlussInstance
    }

    @Transactional
    def update(Abschluss abschlussInstance) {
        if (abschlussInstance == null) {
            notFound()
            return
        }

        if (abschlussInstance.hasErrors()) {
            respond abschlussInstance.errors, view:'edit'
            return
        }

        abschlussInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Abschluss.label', default: 'Abschluss'), abschlussInstance.id])
                redirect abschlussInstance
            }
            '*'{ respond abschlussInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Abschluss abschlussInstance) {

        if (abschlussInstance == null) {
            notFound()
            return
        }

        abschlussInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Abschluss.label', default: 'Abschluss'), abschlussInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'abschluss.label', default: 'Abschluss'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
