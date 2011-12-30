import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Link

@Secured(["hasRole('ROLE_USER')"])
class LinkController {
	def index() {
		def links = Link.withCriteria {
			order("dateCreated", "desc")
		}

		render(view:"index", model:[links: links])
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
	
	def addComment() {
		Link link = Link.get(params.id)
		if(!link) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		link.addComment(params.comment)

		if(link.save()) {
			flash.info = "Succesfully added the comment to artefact"
			redirect(action:"edit", id: link.id)
		}
		else {
			flash.error = "Cannot add comment to artefact : ${link.errors}"
			render(view:"edit", model:[link: link])
		}
	}

	def updateComment() {
		Link link = Link.get(params.id)
		if(!link) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		link.updateComment(Integer.valueOf(params.index), params.comment)

		if(link.save()) {
			render(params.comment)
		}
		else {
			flash.error = "Cannot update comment from artefact : ${link.errors}"
			redirect(action:"edit", id:link.id)
		}
	}

	def deleteComment() {
		Link link = Link.get(params.id)
		if(!link) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		link.deleteComment(Integer.valueOf(params.index))

		if(link.save()) {
			flash.info = "Succesfully removed the comment fromt artefact"
			redirect(action:"edit", id: link.id)
		}
		else {
			flash.error = "Cannot remove comment from artefact : ${link.errors}"
			render(view:"edit", model:[link: link])
		}
	}
}
