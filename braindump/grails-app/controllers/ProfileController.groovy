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

	def changePassword() {
		Account profile = Account.get(params.id)
		if(!profile) {
			flash.error = "Profile '${params.id}' not found"
			return redirect(controller:"home")
		}
		
		if(params.password != params.confirmPassword) {
			flash.error = "Confirm password not the same as new password"
			return redirect(action:"edit", id:params.id)
		}
		if(profile.password != springSecurityService.encodePassword(params.oldPassword, profile.username)) {
			flash.error = "Old password is not correct"
			return redirect(action:"edit", id:params.id)
		}

		profile.password = springSecurityService.encodePassword(params.password, profile.username)

		if(profile.save()) {
			flash.info = "Succesfully change the profile password"
			return redirect(action:"edit", id:params.id)
		}
		else {
			flash.error = "Cannot change profile profile : ${profile.errors}"
			return redirect(action:"edit", id:params.id)
		}
	}
}
