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
                    <label for='name'><g:message code="contact.name.label"/></label>
                    <div class="input"><g:textField class="large" name="name" maxlength="100" value="${contact.name}" /></div>
                </div>
                <div class="clearfix">
                    <label for='mobilePhone'><g:message code="contact.mobilePhone.label"/></label>
                    <div class="input"><g:textField class="small" name="mobilePhone" maxlength="50" value="${contact.mobilePhone}" /></div>
                </div>
                <div class="clearfix">
                    <label for='homePhone'><g:message code="contact.homePhone.label"/></label>
                    <div class="input"><g:textField class="small" name="homePhone" maxlength="50" value="${contact.homePhone}" /></div>
                </div>
                <div class="clearfix">
                    <label for='workPhone'><g:message code="contact.workPhone.label"/></label>
                    <div class="input"><g:textField class="small" name="workPhone" maxlength="50" value="${contact.workPhone}"/></div>
                </div>
                <div class="clearfix">
                    <label for='notes'><g:message code="contact.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" value="${contact.notes}"/></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="contact.tags.label"/></label>
                    <div class="input">
						<g:render template="/templates/editTags" model="[tags:contact.tags]" />
	                </div>
                </div>
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	                <g:link class="btn" name="cancel" controller="contact"><g:message code="default.button.cancel.label"/></g:link>
	                <a id="deleteButton" style="float: right;" class="btn danger" data-controls-modal="delete-confirm-modal" data-backdrop="true" data-keyboard="true"><g:message code="default.button.delete.label"/></a>
	             </div> 
            </fieldset>
		</g:form>
		<g:render template="/templates/confirmationDeleteDialog" model="[controller:'contact', action:'delete', id:contact.id]" />
	</body>
</html>