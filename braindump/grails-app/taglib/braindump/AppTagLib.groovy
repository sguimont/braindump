package braindump

class AppTagLib {
	static namespace = "app"
	
	def isNew = { attrs, body ->
		if((new Date() - attrs.date) < 5) {
			out << body()
		}
	} 
}
