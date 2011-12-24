import org.apache.commons.lang.StringUtils

import com.mushcorp.lt.security.Account
import com.mushcorp.lt.security.Role

class BootStrap {

	def springSecurityService
	
	def init = { servletContext ->
		String VCAP_SERVICES = System.getenv('VCAP_SERVICES')
		println "VCAP_SERVICES: ${System.getenv('VCAP_SERVICES')}"
	  
	  String.metaClass.intro = {len ->
			return StringUtils.abbreviate(delegate, len) ?: ''
		}
		GString.metaClass.intro = {len ->
			return StringUtils.abbreviate(delegate.toString(), len)
		}

		println "Check Role"
		if(!Role.count()) {
			new Role(authority: "ROLE_ADMIN").save()
		}

		println "Check Account"
		if(!Account.findByUsername('admin')) {
			def adminRole = Role.findByAuthority('ROLE_ADMIN')
			new Account(firstName:"admin", lastName:"admin", username:"admin", password:springSecurityService.encodePassword("admin","admin"), enabled:true, accountExpired:false, accountLocked:false, passwordExpired:false, authorities:[adminRole]).save()
		}
	}

	def destroy = {
	}
}
