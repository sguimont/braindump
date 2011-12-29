		<ul data-role="listview">
		<g:each in="${contacts}" var="contact">
		<li contactId="${contact.id}">
            <div class="flag">
            	<app:isNew date="${contact.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            <app:isUpdatedRecently dateCreated="${contact.dateCreated}" lastUpdated="${contact.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
            </div>
			<div>
				${contact.name}<g:if test="${contact.tags}"><br/>
				<g:each var="tag" in="${contact.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
			</div>
            <div style="color: #AAA; text-align: right; white-space: nowrap;" class="ui-li-aside">
            	<g:formatDate date="${contact.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/>
            	<prettytime:display date="${contact.lastUpdated}" />
			</div>
		</li>
		</g:each>
		</ul>