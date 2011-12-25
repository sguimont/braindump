import org.apache.commons.lang.StringUtils

import com.mushcorp.lt.security.Account
import com.mushcorp.lt.security.Role

class BootStrap {

	def springSecurityService

	def init = { servletContext ->
		String.metaClass.intro = {len ->
			return StringUtils.abbreviate(delegate, len) ?: ''
		}
		GString.metaClass.intro = {len ->
			return StringUtils.abbreviate(delegate.toString(), len)
		}

		println "Check User Role"
		if(!Role.findByAuthority('ROLE_USER')) {
			println "Create User Role"
			new Role(authority: "ROLE_USER").save()
		}
		println "Check Admin Role"
		if(!Role.findByAuthority('ROLE_ADMIN')) {
			println "Create Admin Role"
			new Role(authority: "ROLE_ADMIN").save()
		}

		println "Check Admin Account"
		def userRole = Role.findByAuthority('ROLE_USER')
		def adminRole = Role.findByAuthority('ROLE_ADMIN')
		def adminAccount = Account.findByUsername('admin')
		if(!adminAccount) {
			println "Create Admin Account"
			new Account(firstName:"admin", lastName:"admin", username:"admin", password:springSecurityService.encodePassword("admin","admin"), enabled:true, accountExpired:false, accountLocked:false, passwordExpired:false, authorities:[userRole, adminRole]).save()
		}
		else {
			println "Update Admin Account"
			adminAccount.addToAuthorities(userRole)
			adminAccount.addToAuthorities(adminRole)
			adminAccount.save()
		}
	}

	def destroy = {
	}
}
