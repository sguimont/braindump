import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.artefact.Link

@Secured(["hasRole('ROLE_USER')"])
class LinkController {
	def index() {
		render(view:"index", model: [recentLinks: Link.collection.find().sort('dateCreated' : -1).limit(10)])
	}

	def create() {
		Link link = new Link()
		link.properties = params

		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!link.tags.contains(tag.trim())) {
					link.tags.add(tag.trim())
				}
			}
		}

		if(link.save()) {
			flash.info = "Succesfull created the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot create artefact : " + link.errors
			println link.errors
			render(view:"index", model: [recentLinks: Link.collection.find().sort('dateCreated' : -1).limit(10)])
		}
	}
	
	def edit() {
		render(view:"edit", model: [link: Link.get(params.id)])
	}

	def save() {
		Link link = Link.get(params.id)
		link.properties = params

		link.tags.clear()
		for (tag in params.list('tag')) {
			if(tag.trim()) {
				if(!link.tags.contains(tag.trim())) {
					link.tags.add(tag.trim())
				}
			}
		}

		if(link.save()) {
			flash.info = "Succesfull updated the artefact"
			return redirect(action:"index")
		}
		else {
			flash.error = "Cannot update artefact : " + link.errors
			println link.errors
			render(view:"edit", model: [link: link])
		}
	}
}
