import grails.plugins.springsecurity.Secured

import java.text.SimpleDateFormat

import com.mushcorp.lt.artefact.Todo


@Secured(["hasRole('ROLE_USER')"])
class TodoController {

    def index() {
        render(view: "index", model: [recentTodos: Todo.collection.find().sort('dateCreated': -1).limit(10)])
    }

    def create() {
        Todo todo = new Todo()
        todo.properties = params
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		todo.reminder = dateFormat.parse(params.reminderDateTime)    

		for (tag in params.list('tag')) {
			if(tag.trim()) {
				todo.tags.add(tag.trim())
			}
		}

		if (todo.save()) {
            flash.info = "Succesfull created the artefact"
            return redirect(action: "index")
        }
        else {
            flash.error = "Cannot create artefact : " + todo.errors
            println todo.errors
            render(view: "index", model: [recentTodos: Todo.collection.find().sort('dateCreated': -1).limit(10)])
        }
    }
}
