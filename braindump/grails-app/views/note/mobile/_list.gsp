		<ul data-role="listview">
		<g:each in="${notes}" var="note">
		<li>
            <div>
				${note.notes.intro(60)}
            	<app:isNew date="${note.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
            	<app:isUpdatedRecently dateCreated="${note.dateCreated}" lastUpdated="${note.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
				<g:if test="${note.tags}"><br/><g:each var="tag" in="${note.tags}"><span class="label">${tag}</span>&nbsp;</g:each></g:if>
			</div>
            <div style="color: #AAA; text-align: right; white-space: nowrap;" class="ui-li-aside">
            	<prettytime:display date="${note.lastUpdated}" />
            </div>
		</li>
		</g:each>
		</ul>