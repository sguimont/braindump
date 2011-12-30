			<div data-role="page" id="book-${book.id}">
				<div data-role="header" data-position="inline">
					<a href="#book" data-icon="arrow-u"><g:message code="book.latest"/></a>
					<h1>${book.title}</h1>
				</div>
				<div data-role="content">
					<p><a href="${book.bookUrl}" rel="external">Go to Book</a></p>	
					<p style="white-space: pre;">${book.notes}</p>
					<h3>Tags</h3>
					<g:each var="tag" in="${book.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
					<h3>Comments</h3>
					<g:each var="comment" in="${book.comments}">
						<p style="white-space: pre;">${comment.comment}</p>
					</g:each>
					<h3>Dates</h3>
					<p>Last Updated at <g:formatDate date="${book.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /></p>
					<p>Created at <g:formatDate date="${book.dateCreated}" format="yyyy-MM-dd HH:mm:ss" /></p>
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div>
			</div> 	        
