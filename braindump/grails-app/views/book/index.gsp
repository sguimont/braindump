<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="default.links.label"/></title>
		<jq:jquery>
			 $('#bookMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="book.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3>Link</h3>
		<g:form action="create" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='title'><g:message code="book.title.label"/></label>
                    <div class="input"><g:textField class="large" name="title" maxlength="100" /></div>
                </div>
                <div class="clearfix">
                    <label for='url'><g:message code="book.url.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="bookUrl" maxlength="255" /></div>
                </div>
                <g:submitButton class="btn small primary" name="create" value="Create" />
            </fieldset>
		</g:form>
		<table class="condensed-table zebra-striped recentList">
		<g:each in="${recentBooks}" var="book">
		<tr>
            <td class="flag"><app:isNew date="${book.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
			<td><g:link url="${book.bookUrl}" target="_blank">${book.title}</g:link></td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;"><g:formatDate date="${book.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${book.lastUpdated}" /></td>
		</tr>
		</g:each>
		</table>
	</body>
</html>