		<table id="notes" class="condensed-table zebra-striped recentList">
		<g:each in="${notes}" var="note">
		<tr noteId="${note.id}">
            <td class="flag">
            	<app:isNew date="${note.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
            	<app:isUpdatedRecently dateCreated="${note.dateCreated}" lastUpdated="${note.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
            </td>
			<td>
				${note.notes.intro(60)}<g:if test="${note.tags}"><br/>
				<g:each var="tag" in="${note.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
			</td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;">
            	<g:formatDate date="${note.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${note.lastUpdated}" /><span class="comment-count">${note.comments.size()}</span>
            </td>
		</tr>
		</g:each>
		</table>