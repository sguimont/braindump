package com.mushcorp.lt.artefact

import artefact.Artefact

class Contact extends Artefact {
	String name
	String mobilePhone
	String homePhone
	String workPhone

	static constraints = {
		name(blank:false, size:1..100)
		mobilePhone(nullable:true)
		homePhone(nullable:true)
		workPhone(nullable:true)
	}

	static mapping = {
		version false
	}

	static mapWith = "mongo"
}
