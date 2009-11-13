import org.nazt.lexto.*
import groovy.util.*
import java.*
class RefalsenewsController {

    def index = {
	
	
	def getnews = News.findAllByNewsIsNotNull()
	
	getnews.each { 
		//render it.news 
		//def refalsenewsInstance = it.news
		
		def lexdict= Vocab.findAll('from Vocab')
		LongLexTo tokenizer=new LongLexTo("SELFED DICT")
		lexdict.each{ tokenizer.addDict(it.vocab.trim()) }
		
		def news = it.news
		tokenizer.wordInstance(news)
		def myTypeList,myIndexList=[]	
		myTypeList = tokenizer.getTypeList()
		myIndexList=tokenizer.getIndexList()
		
		def indexer=0
		def longlexnews=""
		
		myIndexList.eachWithIndex{ val, idx ->
			longlexnews+= news[indexer..val-1] + "|" 
			indexer=val
		}
		it.lexnews=longlexnews;
		it.save();
		
		//render longlexnews + "nat2<br>\n"
	}
	redirect(url:'http://overdrive:9000/ATN/news/list')
	//[date:new Date(),a:longlexnews ]
	
	}
	
}
