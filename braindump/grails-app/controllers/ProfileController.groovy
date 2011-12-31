import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.security.Account

@Secured(["hasRole('ROLE_USER')"])
class ProfileController {
	def springSecurityService

	def edit() {
		Account profile = Account.get(params.id)
		if(profile) {
			render(view:"edit", model: [profile: profile])
		}
		else {
			flash.error = "Profile '${params.id}' not found"
			redirect(controller:"home")
		}
	}

	def save() {
		Account profile = Account.get(params.id)
		if(!profile) {
			flash.error = "Profile '${params.id}' not found"
			redirect(controller:"home")
		}

		profile.properties = params

		if(profile.save()) {
			flash.info = "Succesfully updated the profile"
			redirect(controller:"home")
		}
		else {
			flash.error = "Cannot update profile : ${profile.errors}"
			render(view:"edit", model:[profile: profile])
		}
	}
}
