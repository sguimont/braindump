		<table id="comments" class="condensed-table zebra-striped recentList">
		<g:each in="${comments}" var="comment">
		<tr>
            <td class="flag">
            	<app:isNew date="${comment.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
			</td>
			<td>
				${comment.comment}
			</td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;">
            	<g:formatDate date="${comment.dateCreated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${comment.dateCreated}" />
			</td>
		</tr>
		</g:each>
		</table>