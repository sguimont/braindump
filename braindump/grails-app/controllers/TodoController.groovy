import grails.plugins.springsecurity.Secured

import java.text.SimpleDateFormat

import com.mushcorp.lt.artefact.Todo


@Secured(["hasRole('ROLE_USER')"])
class TodoController {
	def index() {
		render(view:"index", model:[recentTodos: Todo.collection.find().sort('dateCreated': -1)])
	}

	def create() {
		Todo todo = new Todo()
		todo.properties = params
		todo.updateTags(params.list('tag'))

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		todo.reminder = dateFormat.parse(params.reminderDateTime)

		if (todo.save()) {
			flash.info = "Succesfully created the artefact"
			return redirect(action: "index")
		}
		else {
			flash.error = "Cannot create artefact : ${todo.errors}"
			return redirect(action: "index")
		}
	}

	def delete() {
		Todo todo = Todo.get(params.id)
		if(todo) {
			todo.delete()

			flash.info = "Succesfully deleted the artefact"
			redirect(action:"index")
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def edit() {
		Todo todo = Todo.get(params.id)
		if(todo) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			render(view:"edit", model: [todo: todo, reminderDateTime: dateFormat.format(todo.reminder)])
		}
		else {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}
	}

	def save() {
		Todo todo = Todo.get(params.id)
		if(!todo) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		todo.properties = params
		todo.updateTags(params.list('tag'))

		if(todo.save()) {
			flash.info = "Succesfully updated the artefact"
			return redirect(action:"index")
		}
		else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			render(view:"edit", model: [todo: todo, reminderDateTime: dateFormat.format(todo.reminder)])
		}
	}
}
