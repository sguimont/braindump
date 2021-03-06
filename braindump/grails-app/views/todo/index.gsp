<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.todos.label"/></title>
		<jq:jquery>
			 $("#todoMenu").addClass("active")
			 $("#pageHeader").html("<g:message code="todo.quote" encodeAs="JavaScript"/>")
 			 
 			 $("#reminderDateTime").datetimepicker({
 			 	timeFormat: 'h:m',
 			 	dateFormat: 'yy-mm-dd'
 			 });
 			 $("#completeForDateTime").datetimepicker({
 			 	timeFormat: 'h:m',
 			 	dateFormat: 'yy-mm-dd'
 			 });
 			 
 			 $('#todos tr').click(function() {
			 	var todoId = $(this).attr('todoId')
			 	window.location = '<g:createLink controller="todo" action="edit" />/' + todoId 
			 });

			 $("tr[rel=popover]").popover({
				offset: 10,
				html: true,
				delayIn: 500,
				placement: "below",
				title: function() { return "<g:message code="todo.notes.label"/>" },
                live: true
              })
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="todo.title" /></h3>
		<g:form action="create" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='title'><g:message code="todo.todo.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="todo" maxlength="100" /></div>
                </div>
                <div class="clearfix">
                    <label for='completeForDateTime'><g:message code="todo.completeFor.label"/></label>
                    <div class="input"><g:textField class="medium" name="completeForDateTime" /></div>
                </div>
                <div class="clearfix">
                    <label for='reminderDateTime'><g:message code="todo.date.label"/></label>
                    <div class="input"><g:textField class="medium" name="reminderDateTime" /></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="todo.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" /></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="todo.tags.label"/></label>
                    <div class="input">
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
                   </div>
                </div>
                <g:submitButton class="btn primary" name="create" value="${message(code:'default.button.create.label')}" />
            </fieldset>
		</g:form>
		<g:render template="/todo/list" model="[todos:todos]" />		
	</body>
</html>