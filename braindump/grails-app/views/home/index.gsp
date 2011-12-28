recentContacts<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="application.title"/></title>
		<jq:jquery>
			 $("#homeMenu").addClass("active")
			 $("#pageHeader").html("<g:message code="home.quote" encodeAs="JavaScript"/>")

 			 $('#notes tr').click(function() {
			 	var noteId = $(this).attr('noteId')
			 	window.location = '<g:createLink controller="note" action="edit" />/' + noteId 
			 });

 			 $('#links tr').click(function() {
			 	var linkId = $(this).attr('linkId')
			 	window.location = '<g:createLink controller="link" action="edit" />/' + linkId 
			 });

 			 $('#books tr').click(function() {
			 	var bookId = $(this).attr('bookId')
			 	window.location = '<g:createLink controller="book" action="edit" />/' + bookId 
			 });

 			 $('#todos tr').click(function() {
			 	var todoId = $(this).attr('todoId')
			 	window.location = '<g:createLink controller="todo" action="edit" />/' + todoId 
			 });

 			 $('#contacts tr').click(function() {
			 	var contactId = $(this).attr('contactId')
			 	window.location = '<g:createLink controller="contact" action="edit" />/' + contactId 
			 });
		</jq:jquery>
	</head>
	<body>
		<sec:ifLoggedIn>
			<g:if test="${tag}">
				<h1><g:message code="home.search.tag.title" args="[tag]"/></h1>
			</g:if>
			
	        <h3><g:message code="note.latest"/></h3>
			<table id="notes" class="condensed-table zebra-striped">
			<g:each in="${recentNotes}" var="note">
			<tr noteId="${note.id}">
	            <td class="flag">
	            	<app:isNew date="${note.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${note.dateCreated}" lastUpdated="${note.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
	            </td>
				<td>${note.notes.intro(60)}</td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${note.lastUpdated}" /></td>
			</tr>
			</g:each>
			</table>
			
	        <h3><g:message code="link.latest"/></h3>
	        <table id="links" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentLinks}" var="link">
	        <tr linkId="${link.id}">
	            <td class="flag">
	            	<app:isNew date="${link.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${link.dateCreated}" lastUpdated="${link.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
	           	</td>
	            <td><g:link url="${link.url}" target="_blank">${link.title}</g:link></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${link.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        
	        <h3><g:message code="book.latest"/></h3>
	        <table id="books" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentBooks}" var="book">
	        <tr bookId="${book.id}">
	            <td class="flag">
	            	<app:isNew date="${book.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${book.dateCreated}" lastUpdated="${book.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
	            </td>
				<td><g:link url="${book.bookUrl}" target="_blank">${book.title}</g:link></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${book.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        
	        <h3><g:message code="todo.latest"/></h3>
	        <table id="todos" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentTodos}" var="todo">
	        <tr todoId="${todo.id}">
	            <td class="flag">
	            	<app:isNew date="${todo.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${todo.dateCreated}" lastUpdated="${todo.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
	            	<g:if test="${todo.isLate()}"><span class="label important"><g:message code="flag.late"/></span></g:if>
	            	<g:if test="${todo.done}"><span class="label notice"><g:message code="flag.done"/></span></g:if>
	            </td>
	            <td>
	            	<!-- FIXME (SG) : Translate the toto representation  -->
	            	${todo.todo}<g:if test="${todo.completeFor}"> for <g:formatDate date="${todo.completeFor}" format="yyyy-MM-dd HH:mm" /> in <prettytime:display date="${todo.completeFor}" /></g:if>
	            	<g:if test="${todo.tags}"><br/><g:each var="tag" in="${todo.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
				</td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;">
	            	<g:formatDate date="${todo.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${todo.lastUpdated}" />
            </td>
	        </tr>
	        </g:each>
	        </table>
	        
	        <h3><g:message code="contact.latest"/></h3>
	        <table id="contacts" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentContacts}" var="contact">
	        <tr contactId="${contact.id}">
	            <td class="flag">
	            	<app:isNew date="${contact.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${contact.dateCreated}" lastUpdated="${contact.lastUpdated}"><span class="label success"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
	            </td>
	            <td>${contact.name}</td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${contact.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
 	    </sec:ifLoggedIn>
	</body>
</html>
