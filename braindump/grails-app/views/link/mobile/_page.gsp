			<div data-role="page" id="link-${link.id}">
				<div data-role="header" data-position="inline">
					<a href="#link" data-icon="arrow-u"><g:message code="link.latest"/></a>
					<h1>${link.title}</h1>
				</div>
				<div data-role="content">
					<p><a href="${link.url}" rel="external">Go to Link</a></p>	
					<p style="white-space: pre;">${link.notes}</p>
					<h3>Tags</h3>
					<g:each var="tag" in="${link.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
					<h3>Comments</h3>
					<g:each var="comment" in="${link.comments}">
						<p style="white-space: pre;">${comment.comment}</p>
					</g:each>
					<h3>Dates</h3>
					<p>Last Updated at <g:formatDate date="${link.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /></p>
					<p>Created at <g:formatDate date="${link.dateCreated}" format="yyyy-MM-dd HH:mm:ss" /></p>
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div>
			</div> 	        
