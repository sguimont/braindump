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

	static hasMany = [authorities:Role]

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapWith = "mongo"
}
