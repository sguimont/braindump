<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.profile.label"/></title>
		<jq:jquery>
			 $('#profileMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="profile.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="profile.title" /></h3>
		<g:form action="save" method="POST">
			<g:hiddenField name="id" value="${profile.id}"/>
            <fieldset>
                <div class="clearfix">
                    <label for='firstName'><g:message code="profile.firstname.label"/></label>
                    <div class="input"><g:textField class="large" name="firstName" maxlength="100" value="${profile.firstName}" /></div>
                </div>
                <div class="clearfix">
                    <label for='lastName'><g:message code="profile.lastname.label"/></label>
                    <div class="input"><g:textField class="large" name="lastName" maxlength="100" value="${profile.lastName}" /></div>
                </div>
                <div class="clearfix">
                    <label for='mobilePhone'><g:message code="profile.mobilePhone.label"/></label>
                    <div class="input"><g:textField class="small" name="mobilePhone" maxlength="50" value="${profile.mobilePhone}" /></div>
                </div>
                <div class="clearfix">
                    <label for='email'><g:message code="profile.email.label"/></label>
                    <div class="input"><g:textField class="large" name="email" maxlength="255" value="${profile.email}"/></div>
                </div>
                <div class="clearfix">
                    <label for='gmail'><g:message code="profile.gmail.label"/></label>
                    <div class="input"><g:textField class="large" name="gmail" maxlength="255" value="${profile.gmail}"/></div>
                </div>
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="${message(code:'default.button.update.label')}" />
	                <g:link class="btn" name="cancel" controller="home"><g:message code="default.button.cancel.label"/></g:link>
	             </div> 
            </fieldset>
		</g:form>
	</body>
</html>