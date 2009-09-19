import helloworld.*
import org.nazt.lexto.*
import groovy.util.*
import java.*
import groovy.util.*
/*/	System.setProperty( "file.encoding", "UTF-8" );*/
class JavaController {
 
	def myTypeList,myIndexList=[]
    def index = { 
	 System.out.println("Encoding: " + System.getProperty("file.encoding"));
     System.out.println("Charset: " + java.nio.charset.Charset.defaultCharset());
	def myString=[]
	def lexdict=new File("lexitron.txt")
	LongLexTo tokenizer=new LongLexTo("SELFED DICT")
	lexdict.eachLine{ tokenizer.addDict(it.trim()) }
	def news=new File("news.txt")
	news.eachLine{
	tokenizer.wordInstance(it.trim())
		myTypeList = tokenizer.getTypeList()
		myIndexList=tokenizer.getIndexList()
		myString = it


		def indexer=0
		def longlexnews=""
		myIndexList.eachWithIndex{ num, idx ->
			//def type=myTypeList[idx]
			longlexnews+= myString[indexer..num-1] + "|" 
			indexer=num
		}
	new News(news:myString,lexnews:longlexnews,corrected:false).save()
/*		println result*/
		render longlexnews + "nat2"
		
		
				
	}
	
	println System.getProperty("user.dir");

	println myIndexList
	println myTypeList
 

	 System.out.println("Encoding: " + System.getProperty("file.encoding"));
    System.out.println("Charset: " + java.nio.charset.Charset.defaultCharset());
	 } 
}
