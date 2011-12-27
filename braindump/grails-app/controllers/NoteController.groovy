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
			if(tag.trim()) {
				if(!note.tags.contains(tag.trim())) {
					note.tags.add(tag.trim())
				}
			}
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

	def edit() {
		render(view:"edit", model: [note: Note.get(params.id)])
	}

	def save() {
		Note note = Note.get(params.id)
		note.properties = params

		note.tags.clear()
		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!note.tags.contains(tag.trim())) {
					note.tags.add(tag.trim())
				}
			}
		}

		if(note.save()) {
			flash.info = "Succesfull updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : " + note.errors
			println note.errors
			render(view:"edit", model: [note: note])
		}
	}
}
