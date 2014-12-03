package de.dhbw.grails.openData



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrtController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ort.list(params), model:[ortInstanceCount: Ort.count()]
    }

    def show(Ort ortInstance) {
        respond ortInstance
    }

    def create() {
        respond new Ort(params)
    }

    @Transactional
    def save(Ort ortInstance) {
        if (ortInstance == null) {
            notFound()
            return
        }

        if (ortInstance.hasErrors()) {
            respond ortInstance.errors, view:'create'
            return
        }

        ortInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ort.label', default: 'Ort'), ortInstance.id])
                redirect ortInstance
            }
            '*' { respond ortInstance, [status: CREATED] }
        }
    }

    def edit(Ort ortInstance) {
        respond ortInstance
    }

    @Transactional
    def update(Ort ortInstance) {
        if (ortInstance == null) {
            notFound()
            return
        }

        if (ortInstance.hasErrors()) {
            respond ortInstance.errors, view:'edit'
            return
        }

        ortInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ort.label', default: 'Ort'), ortInstance.id])
                redirect ortInstance
            }
            '*'{ respond ortInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Ort ortInstance) {

        if (ortInstance == null) {
            notFound()
            return
        }

        ortInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ort.label', default: 'Ort'), ortInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ort.label', default: 'Ort'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
