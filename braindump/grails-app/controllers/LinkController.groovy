import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Link

@Secured(["hasRole('ROLE_USER')"])
class LinkController {
	def index() {
		render(view:"index", model:[recentLinks: Link.collection.find().sort('dateCreated': -1)])
	}

	def create() {
		Link link = new Link()
		link.properties = params
		link.updateTags(params.list('tag'))

		if (link.save()) {
			flash.info = "Succesfully created the artefact"
			return redirect(action: "index")
		}
		else {
			flash.error = "Cannot create artefact : ${link.errors}"
			return redirect(action: "index")
		}
	}

	def delete() {
		Link link = Link.get(params.id)
		if(link) {
			link.delete()

			flash.info = "Succesfully deleted the artefact"
			redirect(action:"index")
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def edit() {
		Link link = Link.get(params.id)
		if(link) {
			render(view:"edit", model: [link: link])
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def save() {
		Link link = Link.get(params.id)
		if(!link) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		link.properties = params
		link.updateTags(params.list('tag'))

		if(link.save()) {
			flash.info = "Succesfully updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : ${link.errors}"
			render(view:"edit", model:[link: link])
		}
	}
}
