import com.mushcorp.lt.security.Account


class SignUpController {

	def index() {
		return render(status:404)
		render(view:"/signUp/index")
	}

	def signup() {
		return render(status:404)
		
		if(Account.findByUsername(params.username)) {
			flash.message = "User '${params.username}' already registered"
			return render(view:"/signUp/index")
		}

		if(params.password != params.confirmPassword) {
			flash.message = "The confirmation passwor is not identical to password"
			return render(view:"/signUp/index")
		}

		Account account = new Account()
		account.properties = params
		account.enabled = true

		if(account.save()) {
			flash.info = "You are now registered, you signin now!"
			return redirect(controller:'home',action:'index')
		}
		else{
			flash.message = "Cannot create the account"
			return render(view:"/signUp/index")
		}
	}
}
