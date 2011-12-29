package com.mushcorp.lt.artefact

import artefact.Artefact

class Note extends Artefact {

    static constraints = {
    }

	static mapping = {
		version false
	}

	static mapWith = "mongo"
}
