import com.mushcorp.lt.artefact.Book

class BookController {

    def index() {
        render(view: "index", model: [recentBooks: Book.collection.find().sort('dateCreated': -1).limit(10)])
    }

    def create() {
        Book book = new Book()
        book.properties = params

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
}
