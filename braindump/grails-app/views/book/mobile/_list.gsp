		<ul data-role="listview">
		<g:each in="${books}" var="book">
		<li>
			<a href="#book-${book.id}">
	            <div class="flag">
					${book.title}
	            	<app:isNew date="${book.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${book.dateCreated}" lastUpdated="${book.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
					<g:if test="${book.tags}"><br/><g:each var="tag" in="${book.tags}"><span class="label">${tag}</span>&nbsp;</g:each></g:if>
				</div>
	            <div style="color: #AAA; text-align: right; white-space: nowrap;" class="ui-li-aside">
					<a href="${book.bookUrl}" rel="external">Go to Book</a>&nbsp;
	            	<prettytime:display date="${book.lastUpdated}" />
				</div>
			</a>
		</li>
		</g:each>
		</ul>