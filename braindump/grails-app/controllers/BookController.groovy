import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Comment;

@Secured(["hasRole('ROLE_USER')"])
class BookController {
	def springSecurityService
	
	
	def index() {
		def books = Book.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
		}

		render(view:"index", model:[books: books])
	}

	def create() {
		Book book = new Book()
		book.properties = params
		book.accountId = springSecurityService.currentUser.id.toString()
		book.updateTags(params.list('tag'))

		if (book.save()) {
			flash.info = "Succesfully created the artefact"
			return redirect(action: "index")
		}
		else {
			flash.error = "Cannot create artefact : ${book.errors}"
			return redirect(action: "index")
		}
	}

	def delete() {
		Book book = Book.get(params.id)
		if(book) {
			book.delete()

			flash.info = "Succesfully deleted the artefact"
			redirect(action:"index")
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def edit() {
		Book book = Book.get(params.id)
		if(book) {
			render(view:"edit", model: [book: book])
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def save() {
		Book book = Book.get(params.id)
		if(!book) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		book.properties = params
		book.updateTags(params.list('tag'))

		if(book.save()) {
			flash.info = "Succesfully updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : ${book.errors}"
			render(view:"edit", model:[book: book])
		}
	}
	
	def addComment() {
		Book book = Book.get(params.id)
		if(!book) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		book.addComment(params.comment, springSecurityService.currentUser.id.toString())

		if(book.save()) {
			flash.info = "Succesfully added the comment to artefact"
			redirect(action:"edit", id: book.id)
		}
		else {
			flash.error = "Cannot add comment to artefact : ${book.errors}"
			render(view:"edit", model:[book: book])
		}
	}

	def updateComment() {
		Book book = Book.get(params.id)
		if(!book) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		book.updateComment(Integer.valueOf(params.index), params.comment)

		if(book.save()) {
			render(params.comment)
		}
		else {
			flash.error = "Cannot update comment from artefact : ${book.errors}"
			redirect(action:"edit", id:book.id)
		}
	}

	def deleteComment() {
		Book book = Book.get(params.id)
		if(!book) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		book.deleteComment(Integer.valueOf(params.index))

		if(book.save()) {
			flash.info = "Succesfully removed the comment fromt artefact"
			redirect(action:"edit", id: book.id)
		}
		else {
			flash.error = "Cannot remove comment from artefact : ${book.errors}"
			render(view:"edit", model:[book: book])
		}
	}
}
