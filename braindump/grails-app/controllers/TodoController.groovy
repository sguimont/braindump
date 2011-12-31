import grails.plugins.springsecurity.Secured

import java.text.SimpleDateFormat

import com.mushcorp.lt.artefact.Todo


@Secured(["hasRole('ROLE_USER')"])
class TodoController {
	def springSecurityService

	def index() {
		def todos = Todo.withCriteria {
			eq("accountId", springSecurityService.currentUser.id.toString())
			order("dateCreated", "desc")
		}
		
		render(view:"index", model:[todos: todos])
	}

	def create() {
		Todo todo = new Todo()
		todo.properties = params
		todo.accountId = springSecurityService.currentUser.id.toString()
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
	
	def addComment() {
		Todo todo = Todo.get(params.id)
		if(!todo) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		todo.addComment(params.comment, springSecurityService.currentUser.id.toString())

		if(todo.save()) {
			flash.info = "Succesfully added the comment to artefact"
			redirect(action:"edit", id: todo.id)
		}
		else {
			flash.error = "Cannot add comment to artefact : ${todo.errors}"
			render(view:"edit", model:[todo: todo])
		}
	}

	def updateComment() {
		Todo todo = Todo.get(params.id)
		if(!todo) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		todo.updateComment(Integer.valueOf(params.index), params.comment)

		if(todo.save()) {
			render(params.comment)
		}
		else {
			flash.error = "Cannot update comment from artefact : ${todo.errors}"
			redirect(action:"edit", id:todo.id)
		}
	}

	def deleteComment() {
		Todo todo = Todo.get(params.id)
		if(!todo) {
			flash.error = "Artefact '${params.id}' not found"
			redirect(action:"index")
		}

		todo.deleteComment(Integer.valueOf(params.index))

		if(todo.save()) {
			flash.info = "Succesfully removed the comment fromt artefact"
			redirect(action:"edit", id: todo.id)
		}
		else {
			flash.error = "Cannot remove comment from artefact : ${todo.errors}"
			render(view:"edit", model:[todo: todo])
		}
	}
}
