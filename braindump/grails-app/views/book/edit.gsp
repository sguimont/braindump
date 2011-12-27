<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.books.label"/></title>
		<jq:jquery>
			 $('#bookMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="book.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="book.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${book.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='notes'><g:message code="book.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${book.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="book.tags.label"/></label>
                    <div class="input">
                    	<g:each var="tag" in="${book.tags}">
		                    <g:textField name="tag" class="small" value="${tag}" />
                    	</g:each>
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                </div>
                </div>
                <g:submitButton class="btn small primary" name="save" value="${message(code:'default.button.update.label')}" />
                <g:link class="btn small" name="cancel" controller="book"><g:message code="default.button.cancel.label"/></g:link>
            </fieldset>
		</g:form>
	</body>
</html>