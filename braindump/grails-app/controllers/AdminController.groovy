import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo
import com.mushcorp.lt.security.Account;

@Secured(["hasRole('ROLE_ADMIN')"])
class AdminController {
	def pusherService
	
    def index() { 
	}

	def sendEvent() {
		def result = pusherService.triggerPush("braindump", "application", "{ 'type' : 'application', 'date' : '${new Date()}' }")

		flash.warning = "Pusher return value: ${result}"
		redirect(action:"index")
	}
	
	def sendUserEvent() {
		if (request.get) {
			return	
		}
		
		def result = pusherService.triggerPush("braindump", params.username, "{ 'type' : 'user', 'date' : '${new Date()}' }")
		
		flash.warning = "Pusher return value: ${result}"
		redirect(action:"sendUserEvent")
	}

	def backup() {
		 render(contentType: "text/json") {
			 backup(
				 accounts : array {
					 for (a in Account.findAll()) {
						 account(
							 'id': a.id.toString(),
							 roles: array { 
								 a.authorities.each {
									 role(role:it.authority)
								 } 
							 },
						 	 username: a.username,
						 	 password: a.password,
						 	 enabled: a.enabled,
						 	 accountExpired: a.accountExpired,
						 	 accountLocked: a.accountLocked,
						 	 passwordExpired: a.passwordExpired,
					 		 firstName: a.firstName,
							 lastName: a.lastName,
							 mobilePhone: a.mobilePhone,
							 email: a.email,				 
							 gmail: a.gmail
						)
					 }
				 },
				 notes : array {
					 for (a in Note.findAll()) {
						 note(
							 'id': a.id.toString(),
							 accountId:a.accountId,
							 dateCreated:a.dateCreated, 
							 lastUpdated:a.lastUpdated, 
							 tags: array { 
								 a.tags.each {
									 tag(tag:it)
								 } 
							 },
							 notes: a.notes,
							 comments : array { 
									 a.comments.each {
										 comment(comment:it.comment, dateCreated:it.dateCreated, lastUpdated:it.lastUpdated, accountId:it.accountId) 
									 }
							 }
						)
					 }
				 },
				 books : array {
					 for (a in Book.findAll()) {
						 book(
							 'id': a.id.toString(),
							 accountId:a.accountId,
							 dateCreated:a.dateCreated, 
							 lastUpdated:a.lastUpdated, 
							 tags: array { 
								 a.tags.each {
									 tag(tag:it)
								 } 
							 },
							 notes: a.notes,
							 comments : array { 
									 a.comments.each {
										 comment(comment:it.comment, dateCreated:it.dateCreated, lastUpdated:it.lastUpdated, accountId:it.accountId) 
									 }
							 },
						 	title: a.title,
							bookUrl: a.bookUrl
						)
					 }
				 },
				 links : array {
					 for (a in Link.findAll()) {
						 link(
							 'id': a.id.toString(),
							 accountId:a.accountId,
							 dateCreated:a.dateCreated, 
							 lastUpdated:a.lastUpdated, 
							 tags: array { 
								 a.tags.each {
									 tag(tag:it)
								 } 
							 },
							 notes: a.notes,
							 comments : array { 
									 a.comments.each {
										 comment(comment:it.comment, dateCreated:it.dateCreated, lastUpdated:it.lastUpdated, accountId:it.accountId) 
									 }
							 },
						 	title: a.title,
							url: a.url
						)
					 }
				 },
				 todos : array {
					 for (a in Todo.findAll()) {
						 todo(
							 'id': a.id.toString(),
							 accountId:a.accountId,
							 dateCreated:a.dateCreated, 
							 lastUpdated:a.lastUpdated, 
							 tags: array { 
								 a.tags.each {
									 tag(tag:it)
								 } 
							 },
							 notes: a.notes,
							 comments : array { 
									 a.comments.each {
										 comment(comment:it.comment, dateCreated:it.dateCreated, lastUpdated:it.lastUpdated, accountId:it.accountId) 
									 }
							 },
						 	todo: a.todo,
							completeFor: a.completeFor,
							reminder: a.reminder,
							done: a.done,
							to: a.to
						)
					 }
				 },
				 contacts : array {
					 for (a in Contact.findAll()) {
						 contact(
							 'id': a.id.toString(),
							 accountId:a.accountId,
							 dateCreated:a.dateCreated, 
							 lastUpdated:a.lastUpdated, 
							 tags: array { 
								 a.tags.each {
									 tag(tag:it)
								 } 
							 },
							 notes: a.notes,
							 comments : array { 
									 a.comments.each {
										 comment(comment:it.comment, dateCreated:it.dateCreated, lastUpdated:it.lastUpdated, accountId:it.accountId) 
									 }
							 },
							 name: a.name,
							 mobilePhone: a.mobilePhone,
							 homePhone: a.homePhone,
							 workPhone: a.workPhone,
							 email: a.email,				 
							 gmail: a.gmail
						)
					 }
				 }
			 )
		 }
	}
}
