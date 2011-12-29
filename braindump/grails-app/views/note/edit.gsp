<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.notes.label"/></title>
		<jq:jquery>
			 $('#noteMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="note.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="note.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${note.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='notes'><g:message code="note.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${note.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="note.tags.label"/></label>
                    <div class="input">
						<g:render template="/templates/editTags" model="[tags:note.tags]" />
	                </div>
                </div>
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	                <g:link class="btn" name="cancel" controller="note"><g:message code="default.button.cancel.label"/></g:link>
	                <a id="deleteButton" style="float: right;" class="btn danger" data-controls-modal="delete-confirm-modal" data-backdrop="true" data-keyboard="true"><g:message code="default.button.delete.label"/></a>
	            </div> 
            </fieldset>
		</g:form>
		<g:render template="/templates/confirmationDeleteDialog" model="[controller:'note', action:'delete', id:note.id]" />

		<g:render template="/templates/commentList" model="[comments:note.comments]" />
		<g:render template="/templates/commentAddForm" model="[id:note.id]" />
	</body>
</html>