import org.apache.commons.lang.StringUtils

import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo
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

		def userRole = new Role(authority: 'ROLE_USER')
		def adminRole = new Role(authority: 'ROLE_ADMIN')

		println "Check Admin Account"
		def adminAccount = Account.findByUsername('admin')
		if(!adminAccount) {
			println "Create Admin Account"
			adminAccount = new Account(firstName:"Administrator", lastName:"Administrator", username:"admin", password:springSecurityService.encodePassword("salut99","admin"), enabled:true, accountExpired:false, accountLocked:false, passwordExpired:false, authorities:[userRole, adminRole])
			if(!adminAccount.save()) {
				println "Problem with admin account : ${adminAccount.errors}"
			}
		}
		println "Check sguimont Account"
		def sguimontAccount = Account.findByUsername('sguimont')
		if(!sguimontAccount) {
			println "Create sguimont Account"
			sguimontAccount = new Account(firstName:"Sébastien", lastName:"Guimont", username:"sguimont", email:"sebastieng@sympatico.ca", gmail:"sebastieng@sympatico.ca", password:springSecurityService.encodePassword("salut99","sguimont"), enabled:true, accountExpired:false, accountLocked:false, passwordExpired:false, authorities:[userRole, adminRole])
			if(!sguimontAccount.save()) {
				println "Problem with sguimont account : ${sguimontAccount.errors}"
			}
		}
	}

	def destroy = {
	}
}
