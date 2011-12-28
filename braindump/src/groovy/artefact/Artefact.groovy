package artefact

import org.bson.types.ObjectId

abstract class Artefact {
	ObjectId id

	String notes
	List<String> tags = new ArrayList<String>()
	List<Comment> comments = new ArrayList<Comment>()

	Date dateCreated
	Date lastUpdated

	void updateTags(List<String> newTags) {
		if(tags) {
			tags.clear()
		}
		else {
			tags = new ArrayList<String>()
		}

		for (tag in newTags) {
			if(tag.trim()) {
				if(!tags.contains(tag.trim())) {
					tags.add(tag.trim())
				}
			}
		}
	}

	static constraints = {
		notes(nullable: true, blank:true, size:0..50000)
	}

	static mapWith = "mongo"
}
