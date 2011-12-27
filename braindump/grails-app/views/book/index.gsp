<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/> - <g:message code="default.links.label"/></title>
		<jq:jquery>
			 $('#bookMenu').addClass("active")
			 $("#pageHeader").html("<g:message code="book.quote" encodeAs="JavaScript"/>")
			 
			 $('#books tr').click(function() {
			 	var bookId = $(this).attr('bookId')
			 	window.location = '<g:createLink controller="book" action="edit" />/' + bookId 
			 });
			 
		</jq:jquery>
	</head>
	<body>
		<h3><g:message code="book.title" /></h3>
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
                <div class="clearfix">
                    <label for='url'><g:message code="book.notes.label"/></label>
                    <div class="input"><g:textArea class="span7" name="notes" cols="50" rows="5" /></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="book.tags.label"/></label>
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
		<table id="books" class="condensed-table zebra-striped recentList">
		<g:each in="${recentBooks}" var="book">
		<tr bookId="${book._id}">
            <td class="flag"><app:isNew date="${book.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
			<td><g:link url="${book.bookUrl}" target="_blank">${book.title}</g:link><g:if test="${book.tags}"><br/><g:each var="tag" in="${book.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if></td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;"><g:formatDate date="${book.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${book.lastUpdated}" /></td>
		</tr>
		</g:each>
		</table>
	</body>
</html>