class BootStrap {

     def init = { servletContext ->
		new News(news:'myString',lexnews:'longlexnews',corrected:null).save()
     }
     def destroy = {
     }
} 