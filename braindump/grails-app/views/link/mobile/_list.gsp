<ul data-role="listview">
<g:each in="${links}" var="link">
<li>
	<a href="#link-${link.id}">
		<span>
			${link.title}
           	<app:isNew date="${link.dateCreated}"><span class="label success">&nbsp;<g:message code="flag.new"/></span></app:isNew>
           	<app:isUpdatedRecently dateCreated="${link.dateCreated}" lastUpdated="${link.lastUpdated}">&nbsp;<span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
			<br/>&nbsp;<g:each var="tag" in="${link.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
		</span>
        <span class="ui-li-aside right-note">
        	<prettytime:display date="${link.lastUpdated}" />
        </span>
   	</a>
</li>
</g:each>
</ul>