<!doctype html>
<html>
	<head>
		<meta name="layout" content="mobile"/>
		<title><g:message code="application.title"/></title>
	</head>
	<body>
			<div data-role="page" id="home">
				<div data-role="header">
					<h1><g:message code="application.title"/></h1>
				</div>
				<ul data-role="listview">
					<li><a href="#note"><g:message code="note.latest"/></a><span class="ui-li-count">${recentNotes.size()}</span></li>
					<li><a href="#link"><g:message code="link.latest"/></a><span class="ui-li-count">${recentLinks.size()}</span></li>
					<li><a href="#book"><g:message code="book.latest"/></a><span class="ui-li-count">${recentBooks.size()}</span></li>
					<li><a href="#todo"><g:message code="todo.latest"/></a><span class="ui-li-count">${recentTodos.size()}</span></li>
					<li><a href="#contact"><g:message code="contact.latest"/></a><span class="ui-li-count">${recentContacts.size()}</span></li>
				</ul>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="note">
				<div data-role="header">
					<h1><g:message code="note.latest"/></h1>
					<a href="#home" data-icon="home">Home</a>
				</div>
				<div data-role="content">	
					<g:render template="/note/mobile/list" model="[notes:recentNotes]" />
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="link">
				<div data-role="header">
					<h1><g:message code="link.latest"/></h1>
					<a href="#home" data-icon="home">Home</a>
				</div>
				<div data-role="content">	
					<g:render template="/link/mobile/list" model="[links:recentLinks]" />
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="book">
				<div data-role="header">
					<h1><g:message code="book.latest"/></h1>
					<a href="#home" data-icon="home">Home</a>
				</div>
				<div data-role="content">	
	       			<g:render template="/book/mobile/list" model="[books:recentBooks]" />
	       		</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
			<div data-role="page" id="todo">
				<div data-role="header">
					<h1><g:message code="todo.latest"/></h1>
					<a href="#home" data-icon="home">Home</a>
				</div>
  				<div data-role="content">	
					<g:render template="/todo/mobile/list" model="[todos:recentTodos]" />
				</div>		
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>	        
			<div data-role="page" id="contact">
				<div data-role="header">
					<h1><g:message code="contact.latest"/></h1>
					<a href="#home" data-icon="home">Home</a>
				</div>
				<div data-role="content">	
					<g:render template="/contact/mobile/list" model="[contacts:recentContacts]" />
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div> 	        
			</div>
	</body>
</html>
