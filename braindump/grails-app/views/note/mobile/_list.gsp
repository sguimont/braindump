		<ul data-role="listview">
		<g:each in="${notes}" var="note">
		<li noteId="${note.id}">
            <div class="flag">
            	<app:isNew date="${note.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
            	<app:isUpdatedRecently dateCreated="${note.dateCreated}" lastUpdated="${note.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
            </div>
			<div>
				${note.notes.intro(60)}<g:if test="${note.tags}"><br/>
				<g:each var="tag" in="${note.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
			</div>
            <div style="color: #AAA; text-align: right; white-space: nowrap;" class="ui-li-aside">
            	<g:formatDate date="${note.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${note.lastUpdated}" />
            </div>
		</li>
		</g:each>
		</ul>