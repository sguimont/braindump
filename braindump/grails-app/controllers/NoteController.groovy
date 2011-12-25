import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Note

@Secured(["hasRole('ROLE_USER')"])
class NoteController {
	def index() {
		render(view:"index", model: [recentNotes: Note.collection.find().sort('dateCreated' : -1).limit(10)])
	}

	def create() {
		Note note = new Note()
		note.properties = params

		for (tag in params.list('tag')) {
			note.tags.add(tag)
		}
		
		if(note.save()) {
			flash.info = "Succesfull created the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot create artefact : " + note.errors
            println note.errors
			render(view:"index", model: [recentNotes: Note.collection.find().sort('dateCreated' : -1).limit(10)])
		}
	}
}
