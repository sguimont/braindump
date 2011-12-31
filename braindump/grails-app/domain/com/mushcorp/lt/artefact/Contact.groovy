package com.mushcorp.lt.artefact

import artefact.Artefact

class Contact extends Artefact {
	String name
	
	String mobilePhone
	String homePhone
	String workPhone
	
	String email
	String gmail
	
	static constraints = {
		name(blank:false, size:1..100)
		mobilePhone(nullable:true)
		homePhone(nullable:true)
		workPhone(nullable:true)
		email(nullable:true)
		gmail(nullable:true)
	}

	static mapping = {
		version false
	}

	static mapWith = "mongo"
}
