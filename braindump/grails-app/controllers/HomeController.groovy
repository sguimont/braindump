import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.TagStatistics
import com.mushcorp.lt.artefact.Todo

class HomeController {
	def springSecurityService

	def index() {
		flash.error = null
		flash.warning = null
		flash.info = null

		if(springSecurityService.isLoggedIn()) {
			def recentNotes = Note.withCriteria {
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentLinks = Link.withCriteria {
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentBooks = Book.withCriteria {
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentTodos = Todo.withCriteria {
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentContacts = Contact.withCriteria {
				order("dateCreated", "desc")
				maxResults(5)
			}

			render(view:"index", model: [
						recentNotes: recentNotes,
						recentLinks: recentLinks,
						recentBooks: recentBooks,
						recentTodos: recentTodos,
						recentContacts: recentContacts
					])
		}
		else {
			render(view:"index", model: [])
		}
	}

	def search() {
		if(springSecurityService.isLoggedIn()) {
			render(view:"index", model: [
						recentNotes: Note.collection.find(["tags" : params.tag]).sort('dateCreated' : -1),
						recentLinks: Link.collection.find(["tags" : params.tag]).sort('dateCreated' : -1),
						recentBooks: Book.collection.find(["tags" : params.tag]).sort('dateCreated' : -1),
						recentTodos: Todo.collection.find(["tags" : params.tag]).sort('dateCreated' : -1),
						recentContacts: Contact.collection.find(["tags" : params.tag]).sort('dateCreated' : -1),
						tag: params.tag
					])
		}
		else {
			render(view:"index", model: [])
		}
	}

	def tags() {
		if(springSecurityService.isLoggedIn()) {
			[tags:TagStatistics.collection.find().sort('value' : -1)]
		}
		else {
			[]
		}
	}
}
