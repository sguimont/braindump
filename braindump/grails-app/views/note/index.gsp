<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.notes.label"/></title>
		<jq:jquery>
			 $('#noteMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="note.quote" encodeAs="JavaScript"/>")
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="note.title" /></h3>
		<g:form action="create" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='notes'><g:message code="note.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" /></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="note.tags.label"/></label>
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
		<g:each in="${recentNotes}" var="note">
		<tr>
            <td class="flag"><app:isNew date="${note.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
			<td>${note.notes.intro(60)}<g:if test="${note.tags}"><br/><g:each var="tag" in="${note.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if></td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;"><g:formatDate date="${note.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${note.lastUpdated}" /></td>
		</tr>
		</g:each>
		</table>
	</body>
</html>