import grails.plugins.springsecurity.Secured

import com.mushcorp.lt.security.Account
import com.mushcorp.lt.security.Role


@Secured(["hasRole('ROLE_ADMIN')"])
class SignUpController {
	def springSecurityService

	def index() {
		render(view:"/signUp/index")
	}

	def signUp() {
		if(Account.findByUsername(params.username)) {
			flash.message = "User '${params.username}' already registered"
			return render(view:"/signUp/index")
		}

		if(params.password != params.confirmPassword) {
			flash.message = "The confirmation password is not identical to password"
			return render(view:"/signUp/index")
		}

		Account account = new Account()
		account.properties = params
		account.password = springSecurityService.encodePassword(params.password, account.username)
		def userRole = new Role(authority: 'ROLE_USER')
		account.authorities = [userRole]
		account.enabled = true

		if(account.save()) {
			flash.info = "You are now registered, you can signin now!"
			return redirect(controller:'home')
		}
		else{
			flash.message = "Cannot create the account"
			return render(view:"/signUp/index")
		}
	}
}
