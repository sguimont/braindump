import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Contact

@Secured(["hasRole('ROLE_USER')"])
class ContactController {

	def index() {
		def contacts = Contact.withCriteria {
			order("dateCreated", "desc")
		}

		render(view:"index", model:[contacts: contacts])
	}

	def create() {
		Contact contact = new Contact()
		contact.properties = params
		contact.updateTags(params.list('tag'))

		if (contact.save()) {
			flash.info = "Succesfully created the artefact"
			return redirect(action: "index")
		}
		else {
			flash.error = "Cannot create artefact : ${contact.errors}"
			return redirect(action: "index")
		}
	}

	def delete() {
		Contact contact = Contact.get(params.id)
		if(contact) {
			contact.delete()

			flash.info = "Succesfully deleted the artefact"
			redirect(action:"index")
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def edit() {
		Contact contact = Contact.get(params.id)
		if(contact) {
			render(view:"edit", model: [contact: contact])
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def save() {
		Contact contact = Contact.get(params.id)
		if(!contact) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		contact.properties = params
		contact.updateTags(params.list('tag'))

		if(contact.save()) {
			flash.info = "Succesfully updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : ${contact.errors}"
			render(view:"edit", model:[contact: contact])
		}
	}
	
	def addComment() {
		Contact contact = Contact.get(params.id)
		if(!contact) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		contact.addComment(params.comment)

		if(contact.save()) {
			flash.info = "Succesfully added the comment to artefact"
			redirect(action:"edit", id: contact.id)
		}
		else {
			flash.error = "Cannot add comment to artefact : ${contact.errors}"
			render(view:"edit", model:[contact: contact])
		}
	}
}
