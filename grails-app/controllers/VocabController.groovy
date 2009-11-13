

class VocabController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ vocabInstanceList: Vocab.list( params ), vocabInstanceTotal: Vocab.count() ]
    }

    def show = {
        def vocabInstance = Vocab.get( params.id )

        if(!vocabInstance) {
            flash.message = "Vocab not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ vocabInstance : vocabInstance ]
        }
    }

    def delete = {
        def vocabInstance = Vocab.get( params.id )
        if(vocabInstance) {
            try {
                vocabInstance.delete(flush:true)
                flash.message = "Vocab ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Vocab ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Vocab not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def vocabInstance = Vocab.get( params.id )

        if(!vocabInstance) {
            flash.message = "Vocab not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ vocabInstance : vocabInstance ]
        }
    }

    def update = {
        def vocabInstance = Vocab.get( params.id )
        if(vocabInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(vocabInstance.version > version) {
                    
                    vocabInstance.errors.rejectValue("version", "vocab.optimistic.locking.failure", "Another user has updated this Vocab while you were editing.")

                    render view:'edit', model:[vocabInstance:vocabInstance]
                    return
                }
            }
            vocabInstance.properties = params
            if(!vocabInstance.hasErrors() && vocabInstance.save()) {
                flash.message = "Vocab ${params.id} updated"

                redirect action:'show', id:vocabInstance.id
            }
            else {
                render view:'edit', model:[vocabInstance:vocabInstance]
            }
        }
        else {
            flash.message = "Vocab not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def vocabInstance = new Vocab()
        vocabInstance.properties = params		
        return ['vocabInstance':vocabInstance]
    }

    def save = {
        def vocabInstance = new Vocab(params)
        if(vocabInstance.save(flush:true)) {
            flash.message = "Vocab ${vocabInstance.id} created"

            redirect action:"show", id:vocabInstance.id
        }
        else {
            render view:'create', model:[vocabInstance:vocabInstance]
        }
    }
}
