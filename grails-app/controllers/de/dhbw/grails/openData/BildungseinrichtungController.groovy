package de.dhbw.grails.openData



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BildungseinrichtungController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bildungseinrichtung.list(params), model:[bildungseinrichtungInstanceCount: Bildungseinrichtung.count()]
    }

    def show(Bildungseinrichtung bildungseinrichtungInstance) {
        respond bildungseinrichtungInstance
    }

    def create() {
        respond new Bildungseinrichtung(params)
    }

    @Transactional
    def save(Bildungseinrichtung bildungseinrichtungInstance) {
        if (bildungseinrichtungInstance == null) {
            notFound()
            return
        }

        if (bildungseinrichtungInstance.hasErrors()) {
            respond bildungseinrichtungInstance.errors, view:'create'
            return
        }

        bildungseinrichtungInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bildungseinrichtung.label', default: 'Bildungseinrichtung'), bildungseinrichtungInstance.id])
                redirect bildungseinrichtungInstance
            }
            '*' { respond bildungseinrichtungInstance, [status: CREATED] }
        }
    }

    def edit(Bildungseinrichtung bildungseinrichtungInstance) {
        respond bildungseinrichtungInstance
    }

    @Transactional
    def update(Bildungseinrichtung bildungseinrichtungInstance) {
        if (bildungseinrichtungInstance == null) {
            notFound()
            return
        }

        if (bildungseinrichtungInstance.hasErrors()) {
            respond bildungseinrichtungInstance.errors, view:'edit'
            return
        }

        bildungseinrichtungInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Bildungseinrichtung.label', default: 'Bildungseinrichtung'), bildungseinrichtungInstance.id])
                redirect bildungseinrichtungInstance
            }
            '*'{ respond bildungseinrichtungInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Bildungseinrichtung bildungseinrichtungInstance) {

        if (bildungseinrichtungInstance == null) {
            notFound()
            return
        }

        bildungseinrichtungInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Bildungseinrichtung.label', default: 'Bildungseinrichtung'), bildungseinrichtungInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bildungseinrichtung.label', default: 'Bildungseinrichtung'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
