import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Note

@Secured(["hasRole('ROLE_USER')"])
class NoteController {
	def index() {
		def recentNotes = Note.withCriteria {
			order("dateCreated", "desc")
		}
		
		render(view:"index", model:[recentNotes: recentNotes])
	}

	def create() {
		Note note = new Note()
		note.properties = params
		note.updateTags(params.list('tag'))

		if (note.save()) {
			flash.info = "Succesfully created the artefact"
			return redirect(action: "index")
		}
		else {
			flash.error = "Cannot create artefact : ${note.errors}"
			return redirect(action: "index")
		}
	}

	def delete() {
		Note note = Note.get(params.id)
		if(note) {
			note.delete()

			flash.info = "Succesfully deleted the artefact"
			redirect(action:"index")
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def edit() {
		Note note = Note.get(params.id)
		if(note) {
			render(view:"edit", model: [note: note])
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def save() {
		Note note = Note.get(params.id)
		if(!note) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		note.properties = params
		note.updateTags(params.list('tag'))

		if(note.save()) {
			flash.info = "Succesfully updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : ${note.errors}"
			render(view:"edit", model:[note: note])
		}
	}
}
