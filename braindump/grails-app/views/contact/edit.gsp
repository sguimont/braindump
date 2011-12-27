<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.contacts.label"/></title>
		<jq:jquery>
			 $('#contactMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="contact.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="contact.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${contact.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='notes'><g:message code="contact.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${contact.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="contact.tags.label"/></label>
                    <div class="input">
                    	<g:each var="tag" in="${contact.tags}">
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