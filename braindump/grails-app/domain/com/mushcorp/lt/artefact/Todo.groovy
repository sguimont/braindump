package com.mushcorp.lt.artefact

import artefact.Artefact

class Todo extends Artefact {

    String todo
    Date reminder
    Date completeFor
	Boolean done
	String to

    static constraints = {
        todo(blank: false, size: 1..250)
        reminder(nullable: true)
        completeFor(nullable: true)
		done(nullable: true)
        to(nullable: true)
    }
	
	boolean isLate() {
		if(completeFor && !done) {
			return new Date() > completeFor
		}
		
		return false
	}

	static mapping = {
		version false
	}

	static mapWith = "mongo"
}
