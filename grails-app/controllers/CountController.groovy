import java.*
import groovy.util.*
class CountController {

    def index = {
			Float i = News.countByCorrected(false)
			
			Float j= News.countByCorrected(true)
			
			Float l= News.countByNewsIsNotNull()
			
			Float k = j/l			
			
			new Datagraph(countfalse:i,counttrue:j,percentofcutword:k,numberofnews:l).save()
			
			redirect(url:'http://overdrive:9000/ATN/datagraph/graph')
			
			
	}
}
