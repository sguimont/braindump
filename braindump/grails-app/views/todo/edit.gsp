<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.todos.label"/></title>
		<jq:jquery>
			 $('#todoMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="todo.quote" encodeAs="JavaScript"/>")

 			 $("#reminderDateTime").datetimepicker({
 			 	timeFormat: 'h:m',
 			 	dateFormat: 'yy-mm-dd'
 			 });
 			 $("#completeForDateTime").datetimepicker({
 			 	timeFormat: 'h:m',
 			 	dateFormat: 'yy-mm-dd'
 			 });
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="todo.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${todo.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='title'><g:message code="todo.todo.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="todo" maxlength="100" value="${todo.todo}" /></div>
                </div>
                <div class="clearfix">
                    <label for='completeForDateTime'><g:message code="todo.completeFor.label"/></label>
                    <div class="input"><g:textField class="medium" name="completeForDateTime" value="${completeForDateTime}" /></div>
                </div>
                <div class="clearfix">
                    <label for='reminderDateTime'><g:message code="todo.date.label"/></label>
                    <div class="input"><g:textField class="medium" name="reminderDateTime" value="${reminderDateTime}" /></div>
                </div>
                <div class="clearfix">
                    <label for='done'><g:message code="todo.done.label"/></label>
                    <div class="input"><g:checkBox name="done" checked="${todo.done}" /></div>
                </div>
                <div class="clearfix">
                    <label for='notes'><g:message code="todo.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${todo.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="todo.tags.label"/></label>
                    <div class="input">
						<g:render template="/templates/editTags" model="[tags:todo.tags]" />
	                </div>
                </div>
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	                <g:link class="btn" name="cancel" controller="todo"><g:message code="default.button.cancel.label"/></g:link>
	                <a id="deleteButton" style="float: right;" class="btn danger" data-controls-modal="delete-confirm-modal" data-backdrop="true" data-keyboard="true"><g:message code="default.button.delete.label"/></a>
				</div> 
            </fieldset>
		</g:form>
		<g:render template="/templates/confirmationDeleteDialog" model="[controller:'todo', action:'delete', id:todo.id]" />
	</body>
</html>