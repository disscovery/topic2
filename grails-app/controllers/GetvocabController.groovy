import java.*
import groovy.util.*
class GetvocabController {

    def index = { 
			def getdict=new File("dictionary.txt")
			getdict.eachLine{line ->
			new Vocab(vocab:line).save()
			}
			
		redirect(url:'http://localhost:9000/ATN/vocab/list')
	}
}
