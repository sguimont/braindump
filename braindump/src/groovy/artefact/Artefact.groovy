package artefact

import org.bson.types.ObjectId

import com.mushcorp.lt.artefact.Comment

abstract class Artefact {

	static hasMany = [comments:Comment]

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

	void addComment(String comment) {
		Comment newComment = new Comment()
		newComment.comment = comment
		newComment.dateCreated = new Date()
		newComment.lastUpdated = new Date()
		
		if(comments == null) {
			comments = new ArrayList<Comment>()
		}
		comments.add(newComment)
	}
	
	void updateComment(int index, String comment) {
		Comment theComment = comments.get(index)
		theComment.comment = comment
		theComment.lastUpdated = new Date()
	}

	void deleteComment(int index) {
		comments.remove(index)
		if(comments.isEmpty()) {
			comments.clear()
		}
	}

	static constraints = {
		notes(nullable: true, blank:true, size:0..50000)
	}

	static embedded = ['comments']

	static mapping = {
		dateCreated index:true
		version false
	}

	static mapWith = "mongo"
}
