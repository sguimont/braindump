<html>
<head>
	<meta name='layout' content='mobile'/>
	<title><g:message code="application.title"/></title>
	<jq:jquery>
		$("input[type='checkbox']").prop("checked",true).checkboxradio("refresh");
	</jq:jquery>
</head>
<body>
	<div data-role="page" id="login">
		<div data-role="header">
			<h1><g:message code="application.title"/></h1>
		</div>
		<div data-role="content">	
			<g:if test='${flash.message}'>
				<div class='alert-message error'><span>${flash.message}</span></div>
			</g:if>
			<form action='${postUrl}' method='POST' data-ajax="false">
				<label for='username'><g:message code="springSecurity.login.username.label"/></label>
				<div class="input"><input type='text' class='xlarge' name='j_username' id='username'/></div>
				<label for='password'><g:message code="springSecurity.login.password.label"/></label>
				<div class="input"><input type='password' class='xlarge' name='j_password' id='password'/></div>
			    <fieldset data-role="controlgroup">
				   <legend></legend>
				   <input type="checkbox" name="${rememberMeParameter}" id="${rememberMeParameter}" class="custom" />
				   <label for="${rememberMeParameter}" style="width: 250px;"><g:message code="springSecurity.login.remember.me.label"/></label>
			    </fieldset>
	            <button name="submit" type="submit">${message(code: "springSecurity.login.button")}</button>
			</form>
		</div>
		<div data-role="footer">
			<h1>&copy; MushCorp 2011</h1>
		</div> 	        
	</div>
</body>
</html>
