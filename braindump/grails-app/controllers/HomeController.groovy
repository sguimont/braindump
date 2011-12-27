import com.mongodb.DBObject
import com.mongodb.MapReduceCommand
import com.mongodb.MapReduceOutput
import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo

class HomeController {
	def braindumpDB
	
	def index() {
		flash.error = null
		flash.warning = null
		flash.info = null

		def tags = braindumpDB.tagStatistics.find().sort('value' : -1)
		
		render(view:"index", model: [
					recentNotes: Note.collection.find().sort('dateCreated' : -1).limit(5),
					recentLinks: Link.collection.find().sort('dateCreated' : -1).limit(5),
					recentBooks: Book.collection.find().sort('dateCreated' : -1).limit(5),
					recentTodos: Todo.collection.find().sort('dateCreated' : -1).limit(5),
					tags: tags]
				)
	}

	def search() {
		def tags = braindumpDB.tagStatistics.find().sort('value' : -1)

		render(view:"index", model: [
					recentNotes: Note.collection.find(["tags" : params.tag]).sort('dateCreated' : -1).limit(5),
					recentLinks: Link.collection.find(["tags" : params.tag]).sort('dateCreated' : -1).limit(5),
					recentBooks: Book.collection.find(["tags" : params.tag]).sort('dateCreated' : -1).limit(5),
					recentTodos: Todo.collection.find(["tags" : params.tag]).sort('dateCreated' : -1).limit(5),
					tags: tags]
				)
	}
}
