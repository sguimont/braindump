package com.mushcorp.lt.security

import org.bson.types.ObjectId

class Role implements Serializable {
	ObjectId id
	String authority

	static constraints = {
		authority blank: false
	}

	static mapping = { version false }

	static mapWith = "mongo"
}
