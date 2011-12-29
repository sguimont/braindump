<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile"/>
		<title><g:message code="application.title"/></title>
		<jq:jquery>
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
			<div data-role="page" id="note">
				<div data-role="header">
					<h1><g:message code="note.latest"/></h1>
				</div>
				<div data-role="content">	
					<g:render template="/note/list" model="[notes:recentNotes]" />
				</div>
				<ul data-role="pagination">
					<li class="ui-pagination-next"><a href="#link">Next</a></li>
				</ul>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="link">
				<div data-role="header">
					<h1><g:message code="link.latest"/></h1>
				</div>
				<div data-role="content">	
					<g:render template="/link/list" model="[links:recentLinks]" />
				</div>
				<ul data-role="pagination">
					<li class="ui-pagination-prev"><a href="#note">Prev</a></li>
					<li class="ui-pagination-next"><a href="#book">Next</a></li>
				</ul>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="book">
				<div data-role="header">
					<h1><g:message code="book.latest"/></h1>
				</div>
				<div data-role="content">	
	       			<g:render template="/book/list" model="[books:recentBooks]" />
	       		</div>
				<ul data-role="pagination">
					<li class="ui-pagination-prev"><a href="#link">Prev</a></li>
					<li class="ui-pagination-next"><a href="#todo">Next</a></li>
				</ul>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="todo">
				<div data-role="header">
					<h1><g:message code="todo.latest"/></h1>
				</div>
  				<div data-role="content">	
					<g:render template="/todo/list" model="[todos:recentTodos]" />
				</div>		
				<ul data-role="pagination">
					<li class="ui-pagination-prev"><a href="#book">Prev</a></li>
					<li class="ui-pagination-next"><a href="#contact">Next</a></li>
				</ul>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>	        
			<div data-role="page" id="contact">
				<div data-role="header">
					<h1><g:message code="contact.latest"/></h1>
				</div>
				<div data-role="content">	
					<g:render template="/contact/list" model="[contacts:recentContacts]" />
				</div>
				<ul data-role="pagination">
					<li class="ui-pagination-prev"><a href="#todo">Prev</a></li>
				</ul>
				<div data-role="footer">
					<h4>Page Footer</h4>
				</div> 	        
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
	</body>
</html>
