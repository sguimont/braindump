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
			link.tags.add(tag)
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
}
