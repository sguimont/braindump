import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo


@Secured(["hasRole('ROLE_USER')"])
class MobileController {
	def index() {
		flash.error = null
		flash.warning = null
		flash.info = null

		def recentNotes = Note.withCriteria {
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentLinks = Link.withCriteria {
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentBooks = Book.withCriteria {
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentTodos = Todo.withCriteria {
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentContacts = Contact.withCriteria {
			order("dateCreated", "desc")
			maxResults(10)
		}

		render(view:"index", model: [
					recentNotes: recentNotes,
					recentLinks: recentLinks,
					recentBooks: recentBooks,
					recentTodos: recentTodos,
					recentContacts: recentContacts
				])
	}
}
