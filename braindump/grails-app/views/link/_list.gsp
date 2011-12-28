		<table id="links" class="condensed-table zebra-striped recentList">
		<g:each in="${links}" var="link">
		<tr linkId="${link.id}" rel="popover" data-content="${link.notes}">
            <td class="flag">
            	<app:isNew date="${link.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
            	<app:isUpdatedRecently dateCreated="${link.dateCreated}" lastUpdated="${link.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
            </td>
			<td>
				<g:link url="${link.url}" target="_blank">${link.title}</g:link>
				<g:if test="${link.tags}"><br/><g:each var="tag" in="${link.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
			</td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;">
            	<g:formatDate date="${link.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${link.lastUpdated}" />
            </td>
		</tr>
		</g:each>
		</table>