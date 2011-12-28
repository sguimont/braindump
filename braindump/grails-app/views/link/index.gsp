<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.links.label"/></title>
		<jq:jquery>
			 $('#linkMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="link.quote" encodeAs="JavaScript"/>")
			 $('#links tr').click(function() {
			 	var linkId = $(this).attr('linkId')
			 	window.location = '<g:createLink controller="link" action="edit" />/' + linkId 
			 });
			 
			  $("tr[rel=popover]").popover({
				offset: 10,
				html: true,
				delayIn: 500,
				placement: "below",
				title: function() { return "<g:message code="link.notes.label"/>" },
                live: true
              })
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="link.title" /></h3>
		<g:form action="create" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='title'><g:message code="link.title.label"/></label>
                    <div class="input"><g:textField class="large" name="title" maxlength="100" /></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="link.url.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="url" maxlength="255" /></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="link.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" /></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="link.tags.label"/></label>
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
		<g:render template="/link/list" model="[links:recentLinks]" />
	</body>
</html>