<ul data-role="listview">
<g:each in="${books}" var="book">
<li>
	<a href="#book-${book.id}">
		<span>
			${book.title}
           	<app:isNew date="${book.dateCreated}">&nbsp;<span class="label success"><g:message code="flag.new"/></span></app:isNew>
           	<app:isUpdatedRecently dateCreated="${book.dateCreated}" lastUpdated="${book.lastUpdated}">&nbsp;<span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
			<br/>&nbsp;<g:each var="tag" in="${book.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
		</span>
        <span class="ui-li-aside right-note">
           	<prettytime:display date="${book.lastUpdated}" />
		</span>
	</a>
</li>
</g:each>
</ul>