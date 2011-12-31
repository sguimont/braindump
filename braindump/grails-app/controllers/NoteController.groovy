import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Note

@Secured(["hasRole('ROLE_USER')"])
class NoteController {
	def springSecurityService

	def index() {
		def notes = Note.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
		}
		
		render(view:"index", model:[notes: notes])
	}

	def create() {
		Note note = new Note()
		note.properties = params
		note.accountId = springSecurityService.currentUser.id.toString()
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
	
	def addComment() {
		Note note = Note.get(params.id)
		if(!note) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		note.addComment(params.comment, springSecurityService.currentUser.id.toString())

		if(note.save()) {
			flash.info = "Succesfully added the comment to artefact"
			redirect(action:"edit", id: note.id)
		}
		else {
			flash.error = "Cannot add comment to artefact : ${note.errors}"
			render(view:"edit", model:[note: note])
		}
	}

	def updateComment() {
		Note note = Note.get(params.id)
		if(!note) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		note.updateComment(Integer.valueOf(params.index), params.comment)

		if(note.save()) {
			render(params.comment)
		}
		else {
			flash.error = "Cannot update comment from artefact : ${note.errors}"
			redirect(action:"edit", id:note.id)
		}
	}

	def deleteComment() {
		Note note = Note.get(params.id)
		if(!note) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		note.deleteComment(Integer.valueOf(params.index))

		if(note.save()) {
			flash.info = "Succesfully removed the comment fromt artefact"
			redirect(action:"edit", id: note.id)
		}
		else {
			flash.error = "Cannot remove comment from artefact : ${note.errors}"
			render(view:"edit", model:[note: note])
		}
	}
}
