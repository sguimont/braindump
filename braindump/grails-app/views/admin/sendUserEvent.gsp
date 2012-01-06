<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="admin.title"/></title>
	</head>
	<body>
		<h3>Send User Event</h3>
		<g:form action="sendUserEvent" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='username'>Username</label>
                    <div class="input"><g:textField class="large" name="username" maxlength="100" /></div>
                </div>
                <div class="well" style="margin-right: 20px;">
	                <g:submitButton class="btn primary" name="save" value="Send Event" />
	                <g:link class="btn" name="cancel" controller="admin"><g:message code="default.button.cancel.label"/></g:link>
	             </div> 
            </fieldset>
		</g:form>
	</body>
</html>