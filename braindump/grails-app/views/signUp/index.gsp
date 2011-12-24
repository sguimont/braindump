<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="signup.title"/></title>
</head>

<body>
	<div>
		<h3><g:message code="signup.header"/></h3>

		<g:if test='${flash.message}'>
			<div class='alert-message error'><span>${flash.message}</span></div>
		</g:if>

		<g:form controller="signUp" action="signup" method="POST">
		<fieldset>
			<div class="clearfix">
				<label for='username'><g:message code="springSecurity.login.username.label"/></label>
				<div class="input"><input type='text' class='xlarge' name='username' id='username'/></div>
			</div>
			<div class="clearfix">
				<label for='password'><g:message code="springSecurity.login.password.label"/></label>
				<div class="input"><input type='password' class='xlarge' name='password' id='password'/></div>
			</div>
			<div class="clearfix">
				<label for='confirmPassword'><g:message code="login.password.confirm.label"/></label>
				<div class="input"><input type='password' class='xlarge' name='confirmPassword' id='confirmPassword'/></div>
			</div>
		</fieldset>
		<div class="actions">
          <button class="btn primary" type="submit">${message(code: "signup.button")}</button>
          <g:link class="btn secondary" url="../">${message(code: "default.button.cancel.label")}</g:link>
        </div>
		</g:form>
	</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
