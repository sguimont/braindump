package braindump

import com.mongodb.DBObject
import com.mongodb.MapReduceCommand
import com.mongodb.MapReduceOutput
import com.mushcorp.lt.artefact.Book
import com.mushcorp.lt.artefact.Link
import com.mushcorp.lt.artefact.Note
import com.mushcorp.lt.artefact.Todo


class TagStatisticsJob {
	def timeout = 3600000l // execute job once in hour
	//def timeout = 5000l // execute job once in hour
	
	def execute() {

		String m = """function() {
		if(this.tags) {
			this.tags.forEach(
        		function(z) {
            		emit( z , { count : 1 } );
        		}
			);
		}
} 
"""

		String r = """function(tag, values) {
    var total = 0;
    for (var i = 0; i < values.length; i++)
        total += values[i].count;
    return { count : total };
}
"""
		
		println "Note"
		MapReduceCommand cmd = new MapReduceCommand(Note.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REPLACE, null);
		MapReduceOutput out = Note.collection.mapReduce(cmd);
		for ( DBObject obj : out.results() ) {
			println( obj );
		}

		println "Book"
		cmd = new MapReduceCommand(Book.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Book.collection.mapReduce(cmd);
		for ( DBObject obj : out.results() ) {
			println( obj );
		}

		println "Link"
		cmd = new MapReduceCommand(Link.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Link.collection.mapReduce(cmd);
		for ( DBObject obj : out.results() ) {
			println( obj );
		}

		println "Todo"
		cmd = new MapReduceCommand(Todo.collection, m, r, "tagStatistics", MapReduceCommand.OutputType.REDUCE, null);
		out = Todo.collection.mapReduce(cmd);
		for ( DBObject obj : out.results() ) {
			println( obj );
		}
	}
}
