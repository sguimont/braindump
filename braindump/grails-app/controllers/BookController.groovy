import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Book

@Secured(["hasRole('ROLE_USER')"])
class BookController {

	def index() {
		render(view:"index", model:[recentBooks: Book.collection.find().sort('dateCreated': -1)])
	}

	def create() {
		Book book = new Book()
		book.properties = params
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
}
