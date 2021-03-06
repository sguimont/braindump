		<table id="books" class="condensed-table zebra-striped recentList">
		<g:each in="${books}" var="book">
		<tr bookId="${book.id}" rel="popover" data-content="${book.notes}">
            <td class="flag">
            	<app:isNew date="${book.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
            	<app:isUpdatedRecently dateCreated="${book.dateCreated}" lastUpdated="${book.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
			</td>
			<td>
				<g:link url="${book.bookUrl}" target="_blank">${book.title}</g:link><g:if test="${book.tags}"><br/>
				<g:each var="tag" in="${book.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
			</td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;">
            	<g:formatDate date="${book.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${book.lastUpdated}" /><span class="comment-count">${book.comments.size()}</span>
			</td>
		</tr>
		</g:each>
		</table>