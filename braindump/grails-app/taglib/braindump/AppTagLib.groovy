package braindump

class AppTagLib {
	static namespace = "app"
	
	def isNew = { attrs, body ->
		if((new Date() - attrs.date) <= 2) {
			out << body()
		}
	} 

	def isUpdatedRecently = { attrs, body ->
		if((new Date() - attrs.dateCreated) > 2 && (new Date() - attrs.lastUpdated) <= 2) {
			out << body()
		}
	} 
}
