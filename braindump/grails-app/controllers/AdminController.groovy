import grails.plugins.springsecurity.Secured

@Secured(["hasRole('ROLE_ADMIN')"])
class AdminController {

    def index() { 
	}
}
