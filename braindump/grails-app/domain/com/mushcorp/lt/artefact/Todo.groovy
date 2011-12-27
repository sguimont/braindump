package com.mushcorp.lt.artefact

import artefact.Artefact

class Todo extends Artefact {

    String todo
    Date reminder
    Date toComplete
	
	//boolean done

	String to

    static constraints = {
        todo(blank: false, size: 1..250)
        reminder(nullable: true)
        to(nullable: true)
        toComplete(nullable: true)
    }

    static mapWith = "mongo"
}
