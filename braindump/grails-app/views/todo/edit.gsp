<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.todos.label"/></title>
		<jq:jquery>
			 $('#todoMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="todo.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="todo.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${todo.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='notes'><g:message code="todo.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${todo.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="todo.tags.label"/></label>
                    <div class="input">
                    	<g:each var="tag" in="${todo.tags}">
		                    <g:textField name="tag" class="small" value="${tag}" />
                    	</g:each>
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                </div>
                </div>
                <g:submitButton class="btn small primary" name="save" value="${message(code:'default.button.update.label')}" />
                <g:link class="btn small" name="cancel" controller="note"><g:message code="default.button.cancel.label"/></g:link>
            </fieldset>
		</g:form>
	</body>
</html>