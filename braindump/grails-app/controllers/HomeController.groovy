import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.TagStatistics
import com.mushcorp.lt.artefact.Todo

class HomeController {
	def springSecurityService

	def index() {
		withMobileDevice { 
			return redirect(controller:"mobile")	 
		}

		if(springSecurityService.isLoggedIn()) {
			def recentNotes = Note.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				order("dateCreated", "desc")
				maxResults(5)
			}

			def recentLinks = Link.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentBooks = Book.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentTodos = Todo.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				order("dateCreated", "desc")
				maxResults(5)
			}
			def recentContacts = Contact.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
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
				eq("accountId", springSecurityService.currentUser.id.toString())
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagLinks = Link.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagBooks = Book.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagTodos = Todo.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
				eq("tags", params.tag)
				order("dateCreated", "desc")
			}
			def tagContacts = Contact.withCriteria {
				eq("accountId", springSecurityService.currentUser.id.toString())
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
			def tagsStats = TagStatistics.collection.findOne(["_id" : springSecurityService.currentUser.id.toString()])
			[tags:tagsStats.value.tags]
		}
		else {
			[]
		}
	}
}
