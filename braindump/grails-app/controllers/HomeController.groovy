import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.TagStatistics
import com.mushcorp.lt.artefact.Todo

class HomeController {
	def springSecurityService

	def index() {
		withMobileDevice { redirect(controller:"mobile")	 }

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
			def tagNotes = Note.withCriteria {
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagLinks = Link.withCriteria {
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagBooks = Book.withCriteria {
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagTodos = Todo.withCriteria {
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagContacts = Contact.withCriteria {
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}

			render(view:"index", model: [
						recentNotes: tagNotes,
						recentLinks: tagLinks,
						recentBooks: tagBooks,
						recentTodos: tagTodos,
						recentContacts: tagContacts,
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
