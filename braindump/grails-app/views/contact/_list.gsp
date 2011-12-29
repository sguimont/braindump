		<table id="contacts" class="condensed-table zebra-striped recentList">
		<g:each in="${contacts}" var="contact">
		<tr contactId="${contact.id}" rel="popover" data-content="${contact.notes}<br/><br/><b><g:message code="contact.mobilePhone.label"/>: </b>${contact.mobilePhone}<br/><b><g:message code="contact.homePhone.label"/>: </b>${contact.homePhone}<br/><b><g:message code="contact.workPhone.label"/>: </b>${contact.workPhone}">
            <td class="flag">
            	<app:isNew date="${contact.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            <app:isUpdatedRecently dateCreated="${contact.dateCreated}" lastUpdated="${contact.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
            </td>
			<td>
				${contact.name}<g:if test="${contact.tags}"><br/>
				<g:each var="tag" in="${contact.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
			</td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;">
            	<g:formatDate date="${contact.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${contact.lastUpdated}" /><span class="comment-count">${contact.comments.size()}</span>
			</td>
		</tr>
		</g:each>
		</table>