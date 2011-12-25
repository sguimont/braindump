<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code="default.links.label"/></title>
		<jq:jquery>
			 $("#todoMenu").addClass("active")
			 $("#pageHeader").html("<g:message code="todo.quote" encodeAs="JavaScript"/>")
 			 $("#reminderDateTime").datetimepicker({
 			 	timeFormat: 'h:m',
 			 	dateFormat: 'yy-mm-dd'
 			 });
		</jq:jquery>
	</head>
	<body>
		<h3>Todo</h3>
		<g:form action="create" method="POST">
            <fieldset>
                <div class="clearfix">
                    <label for='title'><g:message code="todo.todo.label"/></label>
                    <div class="input"><g:textField class="xlarge" name="todo" maxlength="100" /></div>
                </div>
                <div class="clearfix">
                    <label for='to'><g:message code="todo.to.label"/></label>
                    <div class="input"><g:textField class="large" name="to" maxlength="255" /></div>
                </div>
                <div class="clearfix">
                    <label for='reminderDateTime'><g:message code="todo.date.label"/></label>
                    <div class="input"><g:textField class="medium" name="reminderDateTime" /></div>
                </div>
                <div class="clearfix">
                    <label for='tag'><g:message code="todo.tags.label"/></label>
                    <div class="input">
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
	                    <g:textField name="tag" class="small" />
                   </div>
                </div>
                <g:submitButton class="btn small primary" name="create" value="Create" />
            </fieldset>
		</g:form>
		<table class="condensed-table zebra-striped recentList">
		<g:each in="${recentTodos}" var="todo">
		<tr><!-- FIXME (SG) : Translate the toto representation  -->
            <td class="flag"><app:isNew date="${todo.lastUpdated}"><span class="label success"><g:message code="flag.new"/></span></app:isNew></td>
            <td>${todo.todo}<g:if test="${todo.reminder}"> at <g:formatDate date="${todo.reminder}" format="yyyy-MM-dd HH:mm" /> in <prettytime:display date="${todo.reminder}" /></g:if>
            	<g:if test="${todo.tags}"><br/><g:each var="tag" in="${todo.tags}"><span class="label">${tag}</span>&nbsp;</g:each></g:if></td>
            <td style="color: #AAA; text-align: right; white-space: nowrap;"><g:formatDate date="${todo.lastUpdated}" format="yyyy-MM-dd HH:mm:ss" /><br/><prettytime:display date="${todo.lastUpdated}" /></td>
		</tr>
		</g:each>
		</table>
	</body>
</html>