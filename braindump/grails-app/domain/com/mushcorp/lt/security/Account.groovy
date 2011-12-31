package com.mushcorp.lt.security

import java.io.Serializable

import org.bson.types.ObjectId

class Account  implements Serializable {
	ObjectId id
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	String firstName
	String lastName

	String mobilePhone

	String email
	String gmail

	List<Role> authorities = new ArrayList<Role>()
	static hasMany = [authorities:Role]
	static embedded = ['authorities']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName nullable: true
		lastName nullable: true
		mobilePhone nullable: true
		email nullable: true
		gmail nullable: true
	}

	static mapping = { version false }

	static mapWith = "mongo"
}
