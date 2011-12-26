package braindump

import com.mongodb.DBObject
import com.mongodb.MapReduceCommand
import com.mongodb.MapReduceOutput
import com.mushcorp.lt.artefact.Note


class TagStatisticsJob {
	def timeout = 5000l // execute job once in 5 seconds

	def execute() {

		String m = """function() {
	this.tags.forEach(
        function(z) {
            emit( z , { count : 1 } );
        }
    );
} 
"""

		String r = """function(year, values) {
    var total = 0;
    for (var i = 0; i < values.length; i++)
        total += values[i].count;
    return { count : total };
}
"""
		MapReduceCommand cmd = new MapReduceCommand(Note.collection, m, r, null, MapReduceCommand.OutputType.INLINE, null);
		MapReduceOutput out = Note.collection.mapReduce(cmd);

		for ( DBObject obj : out.results() ) {
			System.out.println( obj );
		}
	}
}
