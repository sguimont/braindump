<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Brain Dump</title>
		<jq:jquery>
			 $("#homeMenu").addClass("active")
			 $("#pageHeader").html("<g:message code="home.quote" encodeAs="JavaScript"/>")

			 var gradient = {
				 0:    '#f00', // red
				 0.33: '#ff0', // yellow
				 0.66: '#0f0', // green
				 1:    '#00f'  // blue
				};
			 
			 $("#myCanvas").tagcanvas({weight: true, weightMode:'both', weightFrom: 'data-weight', weightSize: 15.0, weightGradient : gradient},'tags') 
		</jq:jquery>
	</head>
	<body>
		<sec:ifLoggedIn>
	        <h3><g:message code="note.latest"/></h3>
			<table class="condensed-table zebra-striped">
			<g:each in="${recentNotes}" var="note">
			<tr>
	            <td class="flag"><app:isNew date="${note.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
				<td>${note.notes.intro(60)}</td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${note.lastUpdated}" /></td>
			</tr>
			</g:each>
			</table>
	        <h3><g:message code="link.latest"/></h3>
	        <table class="condensed-table zebra-striped recentList">
	        <g:each in="${recentLinks}" var="link">
	        <tr>
	            <td class="flag"><app:isNew date="${link.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
	            <td><g:link url="${link.url}" target="_blank">${link.title}</g:link></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${link.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        <h3><g:message code="book.latest"/></h3>
	        <table class="condensed-table zebra-striped recentList">
	        <g:each in="${recentBooks}" var="book">
	        <tr>
	            <td class="flag"><app:isNew date="${book.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
				<td><g:link url="${book.bookUrl}" target="_blank">${book.title}</g:link></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${book.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
	        <h3><g:message code="todo.latest"/></h3>
	        <table class="condensed-table zebra-striped recentList">
	        <g:each in="${recentTodos}" var="todo">
	        <tr>
	            <td class="flag"><app:isNew date="${todo.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
	            <td>${todo.todo}<g:if test="${todo.reminder}"> at <g:formatDate date="${todo.reminder}" format="yyyy-MM-dd HH:mm" /> in <prettytime:display date="${todo.reminder}" /></g:if></td>
	            <td style="color: #AAA; text-align: right; white-space: nowrap;"><prettytime:display date="${todo.lastUpdated}" /></td>
	        </tr>
	        </g:each>
	        </table>
 	    </sec:ifLoggedIn>
	</body>
</html>
