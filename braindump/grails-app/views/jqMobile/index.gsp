<!doctype html>
<html>
	<head>
		<meta name="layout" content="jqMobile"/>
		<title><g:message code="application.title"/></title>
	</head>
	<body>
		<div id="header">
		</div>
		<div id="content">
			<div title='Home' id="home" class="panel" selected="true">
				<ul>
					<li><a href="#note"><g:message code="note.latest"/></a></li>
					<li><a href="#link"><g:message code="link.latest"/></a></li>
					<li><a href="#book"><g:message code="book.latest"/></a></li>
					<li><a href="#todo"><g:message code="todo.latest"/></a></li>
					<li><a href="#contact"><g:message code="contact.latest"/></a></li>
				</ul>
			</div>
			<div title="Notes" class="panel" id="note">
				<p>TESTSET</p>
			</div>
			<div title="Links" class="panel" id="link">
				<p>TESTSET</p>
			</div>
			<div title="Books" class="panel" id="book">
				<p>TESTSET</p>
			</div>
			<div title="Todos" class="panel" id="todo">
				<p>TESTSET</p>
			</div>	        
			<div title="Contacts" class="panel" id="contact">
				<p>TESTSET</p>
			</div>
		</div>
		<div id="navbar">
			<div class="horzRule"></div>
		    <a href="#home" class='navbar_home' ontouchstart="">Home</a>
			<a href="#note"  class="navbar_note" ontouchstart="">Notes</a>
		    <a href="#link"  class="navbar_link" ontouchstart="">Links</a>
		    <a href="#book" class="navbar_book" ontouchstart="">Books</a>
		    <a href="#todo" class="navbar_todo" ontouchstart="">Todos</a>
		    <a href="#contact" class="navbar_contact" ontouchstart="">Contacts</a>
		</div>
	</body>
</html>
