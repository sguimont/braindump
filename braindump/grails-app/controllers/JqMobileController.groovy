import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo


@Secured(["hasRole('ROLE_USER')"])
class JqMobileController {
	def springSecurityService

	def index() {
		def recentNotes = Note.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentLinks = Link.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentBooks = Book.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentTodos = Todo.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
			maxResults(10)
		}
		def recentContacts = Contact.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
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
