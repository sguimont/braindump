package com.mushcorp.lt.artefact

import artefact.Artefact

class Link extends Artefact {
    String title
    String url

    static constraints = {
        title(blank:false, size:1..100)
        url(blank:false, size:1..255)
    }

	static mapping = {
		version false
	}

	static mapWith = "mongo"
}
