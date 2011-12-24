package com.mushcorp.lt.artefact

import artefact.Artefact

class Book extends Artefact {
    String title
    String bookUrl

    static constraints = {
        title(blank:false, size:1..100)
        bookUrl(blank:false, size:1..255)
    }

    static mapWith = "mongo"
}
