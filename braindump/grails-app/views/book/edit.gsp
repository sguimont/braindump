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
                    <div class="input"><g:textField class="large" name="title" maxlength="100" value="${fieldValue(bean:book, field:"title")}"/></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="book.url.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="bookUrl" maxlength="255" value="${fieldValue(bean:book, field:"bookUrl")}"/></div>
                </div>
                <div class="clearfix">
                    <label for='notes'><g:message code="book.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${fieldValue(bean:book, field:"notes")}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="book.tags.label"/></label>
                    <div class="input">
						<g:render template="/templates/editTags" model="[tags:book.tags]" />
					</div>
                </div>
            </fieldset>
            <div class="well" style="margin-right: 20px;">
	             <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	             <g:link class="btn" name="cancel" controller="book"><g:message code="default.button.cancel.label"/></g:link>
	             <a id="deleteButton" style="float: right;" class="btn danger" data-controls-modal="delete-confirm-modal" data-backdrop="true" data-keyboard="true"><g:message code="default.button.delete.label"/></a> 
            </div>
		</g:form>
		<g:render template="/templates/confirmationDeleteDialog" model="[controller:'book', action:'delete', id:book.id]" />
		
		<g:render template="/templates/commentList" model="[controller:'book', id:book.id, comments:book.comments]" />
		<g:render template="/templates/commentAddForm" model="[id:book.id]" />
	</body>
</html>