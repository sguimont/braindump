package artefact

import org.bson.types.ObjectId

abstract class Artefact {
	ObjectId id

	String notes
	List<String> tags = new ArrayList<String>()
	List<Comment> comments = new ArrayList<Comment>()

	Date dateCreated
	Date lastUpdated

	static constraints = {
		notes(nullable: true, blank:true, size:0..50000)
	}

	static mapWith = "mongo"
}
