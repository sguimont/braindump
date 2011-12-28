import grails.plugins.springsecurity.Secured

import java.text.SimpleDateFormat

import com.mushcorp.lt.artefact.Todo


@Secured(["hasRole('ROLE_USER')"])
class TodoController {
	def index() {
		def todos = Todo.withCriteria {
			order("dateCreated", "desc")
		}
		
		render(view:"index", model:[todos: todos])
	}

	def create() {
		Todo todo = new Todo()
		todo.properties = params
		todo.updateTags(params.list('tag'))

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		todo.reminder = params.reminderDateTime ? dateFormat.parse(params.reminderDateTime) : null
		todo.completeFor = params.completeForDateTime ? dateFormat.parse(params.completeForDateTime) : null

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
			render(view:"edit", model: [todo: todo, reminderDateTime: todo.reminder ? dateFormat.format(todo.reminder) : "", completeForDateTime: todo.completeFor ? dateFormat.format(todo.completeFor) : ""])
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

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		todo.reminder = params.reminderDateTime ? dateFormat.parse(params.reminderDateTime) : null
		todo.completeFor = params.completeForDateTime ? dateFormat.parse(params.completeForDateTime) : null

		if(todo.save()) {
			flash.info = "Succesfully updated the artefact"
			return redirect(action:"index")
		}
		else {
			render(view:"edit", model: [todo: todo, reminderDateTime: todo.reminder ? dateFormat.format(todo.reminder) : "", completeForDateTime: todo.completeFor ? dateFormat.format(todo.completeFor) : ""])
		}
	}
}
