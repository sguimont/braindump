<ul data-role="listview">
<g:each var="todo" in="${todos}">
<li>
	<a href="#todo-${todo.id}">
		<span>
			<g:if test="${todo.isLate()}"><span class="label important"><g:message code="flag.late"/></span></g:if>
			${todo.todo}<g:if test="${todo.completeFor}"> for <g:formatDate date="${todo.completeFor}" format="yyyy-MM-dd HH:mm" /> in <prettytime:display date="${todo.completeFor}" /></g:if>
			<app:isNew date="${todo.dateCreated}">&nbsp;<span class="label success"><g:message code="flag.new"/></span></app:isNew>
			<app:isUpdatedRecently dateCreated="${todo.dateCreated}" lastUpdated="${todo.lastUpdated}">&nbsp;<span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
			<g:if test="${todo.done}"><span class="label notice"><g:message code="flag.done"/></span></g:if>
			<br/>&nbsp;<g:each var="tag" in="${todo.tags}"><span class="label">${tag}</span>&nbsp;</g:each>
		</span>
        <span class="ui-li-aside right-note">
			<prettytime:display date="${todo.lastUpdated}" />
		</span>
	</a>
</li>
</g:each>
</ul>
