		<g:form action="addComment" method="POST">
			<g:hiddenField name="id" value="${id}"/>
            <fieldset>
                <div class="clearfix">
                    <g:textArea class="span7" name="comment" cols="50" rows="5" />
                </div>
	           	<g:submitButton class="btn primary" name="addComment" value="${message(code:'default.button.comment.label')}" />
            </fieldset>
		</g:form>
