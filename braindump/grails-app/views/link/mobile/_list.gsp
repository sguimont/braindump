		<ul data-role="listview">
		<g:each in="${links}" var="link">
		<li>
			<a href="#link-${link.id}">
	            <div>
					${link.title}
	            	<app:isNew date="${link.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
	            	<app:isUpdatedRecently dateCreated="${link.dateCreated}" lastUpdated="${link.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
					<g:if test="${link.tags}"><br/><g:each var="tag" in="${link.tags}"><span class="label">${tag}</span>&nbsp;</g:each></g:if>
				</div>
	            <div style="color: #AAA; text-align: right; white-space: nowrap;" class="ui-li-aside">
					<a href="${link.url}" rel="external">Go to Link</a>&nbsp;
	            	<prettytime:display date="${link.lastUpdated}" />
	            </div>
           	</a>
		</li>
		</g:each>
		</ul>