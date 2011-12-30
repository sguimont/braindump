<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.links.label"/></title>
		<jq:jquery>
			 $('#linkMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="link.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="link.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${link.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='title'><g:message code="link.title.label"/></label>
                    <div class="input"><g:textField class="large" name="title" maxlength="100" value="${link.title}"/></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="link.url.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="url" maxlength="255" value="${link.url}"/></div>
                </div>
                <div class="clearfix">
                    <label for='notes'><g:message code="link.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${link.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="link.tags.label"/></label>
                    <div class="input">
						<g:render template="/templates/editTags" model="[tags:link.tags]" />
	                </div>
                </div>
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	                <g:link class="btn" name="cancel" controller="link"><g:message code="default.button.cancel.label"/></g:link>
	                <a id="deleteButton" style="float: right;" class="btn danger" data-controls-modal="delete-confirm-modal" data-backdrop="true" data-keyboard="true"><g:message code="default.button.delete.label"/></a>
	            </div> 
            </fieldset>
		</g:form>
		<g:render template="/templates/confirmationDeleteDialog" model="[controller:'link', action:'delete', id:link.id]" />

		<g:render template="/templates/commentList" model="[controller:'link', id:link.id, comments:link.comments]" />
		<g:render template="/templates/commentAddForm" model="[id:link.id]" />
	</body>
</html>