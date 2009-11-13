

class DatagraphController {
    
    def index = {
        redirect action:"list", params:params 
    }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']
	
	def graph ={
		
	 
		def percent = Datagraph.findAllBypercentofcutwordIsNotNull()
		def c=[]
		
        percent.each { c << it.percentofcutword   } 
		def times=(1..c.size())  
		[line:c,x:[0:times.toList()]]
	}
	
    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ datagraphInstanceList: Datagraph.list( params ), datagraphInstanceTotal: Datagraph.count() ]
    }

    def show = {
        def datagraphInstance = Datagraph.get( params.id )

        if(!datagraphInstance) {
            flash.message = "Datagraph not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            [ datagraphInstance : datagraphInstance ]
        }
    }

    def delete = {
        def datagraphInstance = Datagraph.get( params.id )
        if(datagraphInstance) {
            try {
                datagraphInstance.delete(flush:true)
                flash.message = "Datagraph ${params.id} deleted"
                redirect(action:"list")
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Datagraph ${params.id} could not be deleted"
                redirect(action:"show",id:params.id)
            }
        }
        else {
            flash.message = "Datagraph not found with id ${params.id}"
            redirect(action:"list")
        }
    }

    def edit = {
        def datagraphInstance = Datagraph.get( params.id )

        if(!datagraphInstance) {
            flash.message = "Datagraph not found with id ${params.id}"
            redirect action:'list'
        }
        else {
            return [ datagraphInstance : datagraphInstance ]
        }
    }

    def update = {
        def datagraphInstance = Datagraph.get( params.id )
        if(datagraphInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(datagraphInstance.version > version) {
                    
                    datagraphInstance.errors.rejectValue("version", "datagraph.optimistic.locking.failure", "Another user has updated this Datagraph while you were editing.")

                    render view:'edit', model:[datagraphInstance:datagraphInstance]
                    return
                }
            }
            datagraphInstance.properties = params
            if(!datagraphInstance.hasErrors() && datagraphInstance.save()) {
                flash.message = "Datagraph ${params.id} updated"

                redirect action:'show', id:datagraphInstance.id
            }
            else {
                render view:'edit', model:[datagraphInstance:datagraphInstance]
            }
        }
        else {
            flash.message = "Datagraph not found with id ${params.id}"
            redirect action:'list'
        }
    }

    def create = {
        def datagraphInstance = new Datagraph()
        datagraphInstance.properties = params
        return ['datagraphInstance':datagraphInstance]
    }

    def save = {
        def datagraphInstance = new Datagraph(params)
        if(datagraphInstance.save(flush:true)) {
            flash.message = "Datagraph ${datagraphInstance.id} created"

            redirect action:"show", id:datagraphInstance.id
        }
        else {
            render view:'create', model:[datagraphInstance:datagraphInstance]
        }
    }
}
