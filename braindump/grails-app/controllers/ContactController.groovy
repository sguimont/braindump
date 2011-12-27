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
				contact.tags.add(tag.trim())
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
}
