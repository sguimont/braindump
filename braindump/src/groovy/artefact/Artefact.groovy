package artefact

import java.io.Serializable

import org.bson.types.ObjectId

import com.mushcorp.lt.artefact.Comment

abstract class Artefact  implements Serializable {

	ObjectId id
	String accountId

	String notes
	List<String> tags = new ArrayList<String>()

	List<Comment> comments = new ArrayList<Comment>()
	static hasMany = [comments:Comment]
	static embedded = ['comments']

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

	void addComment(String comment, String accountId) {
		Comment newComment = new Comment()
		newComment.comment = comment
		newComment.accountId = accountId
		newComment.dateCreated = new Date()
		newComment.lastUpdated = new Date()

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
			comments = new ArrayList<Comment>();
		}
	}

	static constraints = {
		accountId(blank:false)
		notes(nullable: true, blank:true, size:0..50000)
	}

	static mapping = {
		dateCreated index:true
		accountId index:true
		version false
	}

	static mapWith = "mongo"
}
