import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Book

@Secured(["hasRole('ROLE_USER')"])
class BookController {

	def index() {
		render(view: "index", model: [recentBooks: Book.collection.find().sort('dateCreated': -1).limit(10)])
	}

	def create() {
		Book book = new Book()
		book.properties = params

		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!book.tags.contains(tag.trim())) {
					book.tags.add(tag.trim())
				}
			}
		}

		if (book.save()) {
			flash.info = "Succesfull created the artefact"
			return redirect(action: "index")
		}
		else {
			flash.error = "Cannot create artefact : "  + book.errors
			println book.errors
			render(view: "index", model: [recentBooks: Book.collection.find().sort('dateCreated': -1).limit(10)])
		}
	}
	
	def edit() {
		render(view:"edit", model: [book: Book.get(params.id)])
	}

	def save() {
		Book book = Book.get(params.id)
		book.properties = params

		book.tags.clear()
		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!book.tags.contains(tag.trim())) {
					book.tags.add(tag.trim())
				}
			}
		}

		if(book.save()) {
			flash.info = "Succesfull updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : " + book.errors
			println book.errors
			render(view:"edit", model: [book: book])
		}
	}
}
