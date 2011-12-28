<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.links.label"/></title>
		<jq:jquery>
			 $('#contactMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="contact.quote" encodeAs="JavaScript"/>")
			 $('#contacts tr').click(function() {
			 	var contactId = $(this).attr('contactId')
			 	window.location = '<g:createLink controller="contact" action="edit" />/' + contactId 
			 });
			 
			  $("tr[rel=popover]").popover({
				offset: 10,
				html: true,
				delayIn: 500,
				placement: "below",
				title: function() { return "<g:message code="contact.notes.label"/>" },
                live: true
              })
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="contact.title" /></h3>
		<g:form action="create" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='name'><g:message code="contact.name.label"/></label>
                    <div class="input"><g:textField class="large" name="name" maxlength="100" /></div>
                </div>
                <div class="clearfix">
                    <label for='mobilePhone'><g:message code="contact.mobilePhone.label"/></label>
                    <div class="input"><g:textField class="small" name="mobilePhone" maxlength="50" /></div>
                </div>
                <div class="clearfix">
                    <label for='homePhone'><g:message code="contact.homePhone.label"/></label>
                    <div class="input"><g:textField class="small" name="homePhone" maxlength="50" /></div>
                </div>
                <div class="clearfix">
                    <label for='workPhone'><g:message code="contact.workPhone.label"/></label>
                    <div class="input"><g:textField class="small" name="workPhone" maxlength="50" /></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="contact.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" /></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="contact.tags.label"/></label>
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
		<g:render template="/contact/list" model="[contacts:recentContacts]" />
	</body>
</html>