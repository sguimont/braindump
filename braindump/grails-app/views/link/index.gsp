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
                <g:submitButton class="btn small primary" name="create" value="${message(code:'default.button.create.label')}" />
            </fieldset>
		</g:form>
		<table class="condensed-table zebra-striped recentList">
		<g:each in="${recentLinks}" var="link">
		<tr>
            <td class="flag"><app:isNew date="${link.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
			<td><g:link url="${link.url}" target="_blank">${link.title}</g:link><g:if test="${link.tags}"><br/><g:each var="tag" in="${link.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if></td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;"><g:formatDate date="${link.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${link.lastUpdated}" /></td>
		</tr>
		</g:each>
		</table>
	</body>
</html>