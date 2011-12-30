			<div data-role="page" id="note-${note.id}">
				<div data-role="header" data-position="inline">
					<a href="#note" data-icon="home"><g:message code="note.latest"/></a>
					<h1>Note</h1>
					<g:link controller="logout" rel="external" data-icon="star">Logout</g:link>
				</div>
				<div data-role="content">	
					<p style="white-space: pre;">${note.notes}</p>
					<h3>Tags</h3>
					<g:each var="tag" in="${note.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
					<h3>Comments</h3>
					<g:each var="comment" in="${note.comments}">
						<p style="white-space: pre;">${comment.comment}</p>
					</g:each>
					<h3>Dates</h3>
					<p>Last Updated at <g:formatDate date="${note.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /></p>
					<p>Created at <g:formatDate date="${note.dateCreated}" format="yyyy-MM-dd HH:mm:ss" /></p>
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div>
			</div> 	        
