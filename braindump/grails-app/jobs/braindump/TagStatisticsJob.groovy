package braindump

import com.mongodb.DBObject
import com.mongodb.MapReduceCommand
import com.mongodb.MapReduceOutput
import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Contact;
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo


class TagStatisticsJob {
	def timeout = 3600000l // execute job once in hour
	//def timeout = 5000l // execute job once in hour
	
	def execute() {
		String m = """function() {
		for(var i in this.tags) {
    		emit(this.accountId, { "tags": [{"tag" : this.tags[i], "count" : 1 }] });
		}
}; 
"""
		String r = """function(accountId, emits) {
    var total = {"tags": []};
    for (var i in emits) {
		emits[i].tags.forEach(function(tagInfo) {

			var currentTagInfo = null;
			total.tags.forEach(function(totalTagInfo) {
				if(totalTagInfo.tag == tagInfo.tag) {
					currentTagInfo = totalTagInfo
				}
			})

			if(currentTagInfo) {
				currentTagInfo.count++;
			}
			else {
				total.tags.push({"tag":tagInfo.tag, "count": tagInfo.count});
			}
		})
	}
    return total;
};
"""
		println "Generating tags statistics at ${new Date()}"
		
		MapReduceCommand cmd = new MapReduceCommand(Note.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REPLACE, null);
		MapReduceOutput out = Note.collection.mapReduce(cmd);

		cmd = new MapReduceCommand(Book.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Book.collection.mapReduce(cmd);

		cmd = new MapReduceCommand(Link.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Link.collection.mapReduce(cmd);

		cmd = new MapReduceCommand(Todo.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Todo.collection.mapReduce(cmd);

		cmd = new MapReduceCommand(Contact.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Contact.collection.mapReduce(cmd);
		
		for ( DBObject obj : out.results() ) {
			println( obj );
		}

		println "Done"
		println ""
	}
}
