			<div data-role="page" id="todo-${todo.id}">
				<div data-role="header" data-position="inline">
					<a href="#todo" data-icon="home"><g:message code="todo.latest"/></a>
					<h1><g:message code="todo.title" /></h1>
				</div>
				<div data-role="content">
					<g:if test="${todo.isLate()}"><span class="label important"><g:message code="flag.late"/></span></g:if>
					<g:if test="${todo.done}"><span class="label notice"><g:message code="flag.done"/></span></g:if>
					<h3>${todo.todo}</h3>
					<p>
						<b>Complete for: </b><g:if test="${todo.completeFor}"><g:formatDate date="${todo.completeFor}" format="yyyy-MM-dd HH:mm:ss" /></g:if><br/>
						<b>Reminder at: </b><g:if test="${todo.reminder}"><g:formatDate date="${todo.reminder}" format="yyyy-MM-dd HH:mm:ss" /></g:if><br/>
						<b>Done: </b>${todo.done}<br/>
					</p>
					<p style="white-space: pre;">${todo.notes}</p>
					<h3>Tags</h3>
					<g:each var="tag" in="${todo.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
					<h3>Comments</h3>
					<g:each var="comment" in="${todo.comments}">
						<p style="white-space: pre;">${comment.comment}</p>
					</g:each>
					<h3>Dates</h3>
					<p>Last Updated at <g:formatDate date="${todo.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /></p>
					<p>Created at <g:formatDate date="${todo.dateCreated}" format="yyyy-MM-dd HH:mm:ss" /></p>
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div>
			</div> 	        
