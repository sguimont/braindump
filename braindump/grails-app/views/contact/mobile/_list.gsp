<ul data-role="listview">
<g:each in="${contacts}" var="contact">
	<li>
		<a href="#contact-${contact.id}">
			<span>
				${contact.name}
				<app:isNew date="${contact.dateCreated}">&nbsp;<span class="label success"><g:message code="flag.new"/></span></app:isNew>
				<app:isUpdatedRecently dateCreated="${contact.dateCreated}" lastUpdated="${contact.lastUpdated}">&nbsp;<span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
				<br/>&nbsp;<g:each var="tag" in="${contact.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
			</span>
	        <span class="ui-li-aside right-note">
	        	<prettytime:display date="${contact.lastUpdated}" />
			</span>
		</a>
	</li>
</g:each>
</ul>