<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="application.title"/> - <g:message code="springSecurity.login.title"/></title>
</head>

<body>
	<div>
		<h3><g:message code="springSecurity.login.header"/></h3>

		<g:if test='${flash.message}'>
			<div class='alert-message error'><span>${flash.message}</span></div>
		</g:if>

		<form action='${postUrl}' method='POST'>
		<fieldset>
			<div class="clearfix">
				<label for='username'><g:message code="springSecurity.login.username.label"/></label>
				<div class="input"><input type='text' class='xlarge' name='j_username' id='username'/></div>
			</div>
			<div class="clearfix">
				<label for='password'><g:message code="springSecurity.login.password.label"/></label>
				<div class="input"><input type='password' class='xlarge' name='j_password' id='password'/></div>
			</div>
			<div class="clearfix">
			 	<div class="input">
			 	<ul class="inputs-list">
  					<li>
	                     <label>
	                       <input name='${rememberMeParameter}' type="checkbox" <g:if test='${hasCookie}'>checked='checked'</g:if>/>
	                       <span><g:message code="springSecurity.login.remember.me.label"/></span>
	                     </label>
				 	 </li>
			 	</ul>
			 	</div>
			</div>
		</fieldset>
		<div class="actions">
          <button class="btn primary" type="submit">${message(code: "springSecurity.login.button")}</button>
        </div>
		</form>
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
