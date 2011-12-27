import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Contact

@Secured(["hasRole('ROLE_USER')"])
class ContactController {
	def index() {
		render(view:"index", model: [recentContacts: Contact.collection.find().sort('dateCreated' : -1).limit(10)])
	}

	def create() {
		Contact contact = new Contact()
		contact.properties = params

		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!contact.tags.contains(tag.trim())) {
					contact.tags.add(tag.trim())
				}
			}
		}

		if(contact.save()) {
			flash.info = "Succesfull created the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot create artefact : " + contact.errors
			println contact.errors
			render(view:"index", model: [recentContacts: Contact.collection.find().sort('dateCreated' : -1).limit(10)])
		}
	}
	
	def edit() {
		render(view:"edit", model: [contact: Contact.get(params.id)])
	}

	def save() {
		Contact contact = Contact.get(params.id)
		contact.properties = params

		contact.tags.clear()
		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!contact.tags.contains(tag.trim())) {
					contact.tags.add(tag.trim())
				}
			}
		}

		if(contact.save()) {
			flash.info = "Succesfull updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : " + contact.errors
			println contact.errors
			render(view:"edit", model: [contact: contact])
		}
	}
}
