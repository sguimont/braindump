package com.mushcorp.lt.artefact
import java.util.Date

import org.bson.types.ObjectId;

class Comment  {
	ObjectId id

	String comment
	Date dateCreated

	static constraints = {
		comment(blank:false, size:1..1000)
	}

	static mapping = { version false }
}
