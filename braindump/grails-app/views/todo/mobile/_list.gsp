<ul data-role="listview">
<g:each var="todo" in="${todos}">
<li todoId="${todo.id}">
	<div class="flag">
		<app:isNew date="${todo.dateCreated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew>
		<app:isUpdatedRecently dateCreated="${todo.dateCreated}" lastUpdated="${todo.lastUpdated}"><span class="label warning"><g:message code="flag.updated"/></span></app:isUpdatedRecently>
		<g:if test="${todo.isLate()}"><span class="label important"><g:message code="flag.late"/></span></g:if>
		<g:if test="${todo.done}"><span class="label notice"><g:message code="flag.done"/></span></g:if>
	</div>
	<div>
		<!-- FIXME (SG) : Translate the toto representation  -->
		${todo.todo}<g:if test="${todo.completeFor}"> for <g:formatDate date="${todo.completeFor}" format="yyyy-MM-dd HH:mm" /> in <prettytime:display date="${todo.completeFor}" /></g:if>
		<g:if test="${todo.tags}"><br/><g:each var="tag" in="${todo.tags}"><a href="<g:createLink controller="home" action="search" params="[tag:tag]"/>"><span class="label">${tag}</span></a>&nbsp;</g:each></g:if>
	</div>
	<div style="color: #AAA; text-align: right; white-space: nowrap;" class="ui-li-aside">
		<g:formatDate date="${todo.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${todo.lastUpdated}" />
	</div>
</li>
</g:each>
</ul>
