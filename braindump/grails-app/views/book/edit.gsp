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
                    <label for='title'><g:message code="book.title.label"/></label>
                    <div class="input"><g:textField class="large" name="title" maxlength="100" value="${book.title}"/></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="book.url.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="bookUrl" maxlength="255" value="${book.bookUrl}"/></div>
                </div>
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
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	                <g:link elementId="cancelButton" class="btn" name="cancel" controller="book"><g:message code="default.button.cancel.label"/></g:link>
	                <a id="deleteButton"  style="float: right;" class="btn danger" data-controls-modal="delete-confirm-modal" data-backdrop="true" data-keyboard="true"><g:message code="default.button.delete.label"/></a> 
                </div>
            </fieldset>
		</g:form>
 		<div id="delete-confirm-modal" class="modal hide fade">
            <div class="modal-header">
              <a href="#" class="close">&times;</a>
              <h3><g:message code="modal.delete.confirmation.title"/></h3>
            </div>
            <div class="modal-body">
              <p><g:message code="modal.delete.confirmation.text"/></p>
            </div>
            <div class="modal-footer">
				<g:link class="btn primary" name="delete" controller="book" action="delete" id="${book.id}"><g:message code="default.button.delete.label"/></g:link>
				<button class="btn secondary" onclick="$('#delete-confirm-modal').modal('hide');"><g:message code="default.button.cancel.label"/></button>
            </div>
        </div>
	</body>
</html>