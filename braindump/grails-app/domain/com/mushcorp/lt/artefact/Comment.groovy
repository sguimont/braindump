package com.mushcorp.lt.artefact
import java.util.Date

import org.bson.types.ObjectId;

class Comment  {
	ObjectId id

	String comment
	String accountId
	
	Date dateCreated
	Date lastUpdated

	static constraints = {
		comment(blank:false, size:1..1000)
		accountId(blank:false)
	}

	static mapping = { version false }
}
