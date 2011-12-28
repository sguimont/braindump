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
			 
			 $("tr[rel=popover]").popover({
				offset: 10,
				html: true,
				delayIn: 500,
				placement: "below",
				title: function() { return "<g:message code="home.notes.label"/>" },
                live: true
              })			 
		</jq:jquery>
	</head>
	<body>
		<sec:ifLoggedIn>
			<g:if test="${tag}">
				<h1><g:message code="home.search.tag.title" args="[tag]"/></h1>
			</g:if>
			
	        <h3><g:message code="note.latest"/></h3>
			<g:render template="/note/list" model="[notes:recentNotes]" />
			
	        <h3><g:message code="link.latest"/></h3>
			<g:render template="/link/list" model="[links:recentLinks]" />
	        
	        <h3><g:message code="book.latest"/></h3>
       		<g:render template="/book/list" model="[books:recentBooks]" />
	        
	        <h3><g:message code="todo.latest"/></h3>
			<g:render template="/todo/list" model="[todos:recentTodos]" />		
	        
	        <h3><g:message code="contact.latest"/></h3>
			<g:render template="/contact/list" model="[contacts:recentContacts]" />
 	    </sec:ifLoggedIn>
	</body>
</html>
