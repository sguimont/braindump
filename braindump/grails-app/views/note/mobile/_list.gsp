<ul data-role="listview">
<g:each in="${notes}" var="note">
<li>
	<a href="#note-${note.id}">
		<span>
			${note.notes.intro(60)}
           	<app:isNew date="${note.dateCreated}"><span class="label success">&nbsp;<g:message code="flag.new"/></span></app:isNew>
           	<app:isUpdatedRecently dateCreated="${note.dateCreated}" lastUpdated="${note.lastUpdated}">&nbsp;<span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
			<br/>&nbsp;<g:each var="tag" in="${note.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
		</span>
        <span class="ui-li-aside right-note">
           	<prettytime:display date="${note.lastUpdated}" />
		</span>
	</a>
</li>
</g:each>
</ul>