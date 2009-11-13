import helloworld.*
import org.nazt.lexto.*
import groovy.util.*
import java.*
import groovy.util.*

class JavaController {
 
	def myTypeList,myIndexList=[]
    def index = { 
		//def lexdict=new File("lexitron.txt")
		def lexdict= Vocab.findAll('from Vocab')
		LongLexTo tokenizer=new LongLexTo("SELFED DICT")
		lexdict.each{ tokenizer.addDict(it.vocab.trim()) }
		def news=new File("newstext.txt")
		news.eachLine{ line ->
			tokenizer.wordInstance(line.trim())
			myTypeList = tokenizer.getTypeList()
			myIndexList=tokenizer.getIndexList()
		
			def indexer=0
			def longlexnews=""
			myIndexList.eachWithIndex{ val, idx ->
				longlexnews+= line[indexer..val-1] + "|" 
				indexer=val
			}
			//def i=1
			//def j=2
			//def k=3
			//def l=4
			new News(news:line,lexnews:longlexnews,corrected:false).save()
			//new Datagraph(countfalse:i,counttrue:j,numberofnews:l,percent:k).save()
			render longlexnews + "nat2<br>\n"
		
		
				
		}
	


	println myIndexList
	println myTypeList
	redirect(url:'http://overdrive:9000/ATN/news/list')

	 } 
}
/*/	

	println System.getProperty("user.dir");
	
	System.setProperty( "file.encoding", "UTF-8" );*/
/*System.out.println("Encoding: " + System.getProperty("file.encoding"));
System.out.println("Charset: " + java.nio.charset.Charset.defaultCharset());

 System.out.println("Encoding: " + System.getProperty("file.encoding"));
System.out.println("Charset: " + java.nio.charset.Charset.defaultCharset());
*/