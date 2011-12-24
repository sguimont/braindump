package security

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException

import com.mushcorp.lt.security.Account

class UserDetailsService implements GrailsUserDetailsService {

	UserDetails loadUserByUsername(String username) {
		loadUserByUsername(username, true)
	}

	UserDetails loadUserByUsername(String username, boolean loadRoles) {
		def user = Account.findByUsername(username)
		if(!user) {
			throw new UsernameNotFoundException('User not found: ', username)
		}

		def authorities = user.authorities?.collect { new GrantedAuthorityImpl(it.authority) }
		if(authorities.size() == 0) authorities = [
			new GrantedAuthorityImpl(SpringSecurityUtils.NO_ROLE)
		]

		new GrailsUser(username, user.password, user.enabled, !user.accountExpired, !user.passwordExpired, !user.accountLocked, authorities, user.id)
	}
}
