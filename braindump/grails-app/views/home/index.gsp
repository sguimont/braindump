<!doctype html>
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
			<tr noteId="${note._id}">
	            <td class="flag"><app:isNew date="${note.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
				<td>${note.notes.intro(60)}</td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${note.lastUpdated}" /></td>
			</tr>
			</g:each>
			</table>
			
	        <h3><g:message code="link.latest"/></h3>
	        <table id="links" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentLinks}" var="link">
	        <tr linkId="${link._id}">
	            <td class="flag"><app:isNew date="${link.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
	            <td><g:link url="${link.url}" target="_blank">${link.title}</g:link></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${link.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        
	        <h3><g:message code="book.latest"/></h3>
	        <table id="books" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentBooks}" var="book">
	        <tr bookId="${book._id}">
	            <td class="flag"><app:isNew date="${book.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
				<td><g:link url="${book.bookUrl}" target="_blank">${book.title}</g:link></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${book.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        
	        <h3><g:message code="todo.latest"/></h3>
	        <table id="todos" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentTodos}" var="todo">
	        <tr todoId="${todo._id}">
	            <td class="flag"><app:isNew date="${todo.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
	            <td>${todo.todo}<g:if test="${todo.reminder}"> at <g:formatDate date="${todo.reminder}" format="yyyy-MM-dd HH:mm" /> in <prettytime:display date="${todo.reminder}" /></g:if></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${todo.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        
	        <h3><g:message code="contact.latest"/></h3>
	        <table id="contacts" class="condensed-table zebra-striped recentList">
	        <g:each in="${recentContacts}" var="contact">
	        <tr contactId="${contact._id}">
	            <td class="flag"><app:isNew date="${contact.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
	            <td>${contact.name}</td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${contact.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
 	    </sec:ifLoggedIn>
	</body>
</html>
