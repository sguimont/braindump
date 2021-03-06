			<div data-role="page" id="contact-${contact.id}">
				<div data-role="header" data-position="inline">
					<a href="#contact" data-icon="home"><g:message code="contact.latest"/></a>
					<h1>${contact.name}</h1>
				</div>
				<div data-role="content">
					<p>
						<b><g:message code="contact.mobilePhone.label"/>: </b><a href="tel:${contact.mobilePhone}">${contact.mobilePhone}</a><br/>
						<b><g:message code="contact.homePhone.label"/>: </b><a href="tel:${contact.homePhone}">${contact.homePhone}</a><br/>
						<b><g:message code="contact.workPhone.label"/>: </b><a href="tel:${contact.workPhone}">${contact.workPhone}</a><br/>
					</p>	
					<p>
						<b><g:message code="contact.email.label"/>: </b><a href="mailto:${contact.email}">${contact.email}</a><br/>
						<b><g:message code="contact.gmail.label"/>: </b><a href="mailto:${contact.gmail}">${contact.gmail}</a><br/>
					</p>	
					<p style="white-space: pre;">${contact.notes}</p>
					<h3>Tags</h3>
					<g:each var="tag" in="${contact.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
					<h3>Comments</h3>
					<g:each var="comment" in="${contact.comments}">
						<p style="white-space: pre;">${comment.comment}</p>
					</g:each>
					<h3>Dates</h3>
					<p>Last Updated at <g:formatDate date="${contact.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /></p>
					<p>Created at <g:formatDate date="${contact.dateCreated}" format="yyyy-MM-dd HH:mm:ss" /></p>
				</div>
				<div data-role="footer">
					<h1>&copy; MushCorp 2011</h1>
				</div>
			</div> 	        
