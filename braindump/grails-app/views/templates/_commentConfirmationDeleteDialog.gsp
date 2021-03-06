<div id="delete-comment-confirm-modal-${index}" class="modal hide fade">
	<div class="modal-header">
	<a href="#" class="close">&times;</a>
		<h3><g:message code="modal.delete.confirmation.title"/></h3>
	</div>
	<div class="modal-body">
		<p><g:message code="modal.delete.confirmation.text"/></p>
	</div>
	<div class="modal-footer">
		<g:link class="btn primary" name="deleteComment-${index}" controller="${controller}" action="${action}" id="${id}" params="[index:index]"><g:message code="default.button.delete.label"/></g:link>
		<button class="btn secondary" onclick="$('#delete-comment-confirm-modal-${index}').modal('hide');"><g:message code="default.button.cancel.label"/></button>
	</div>
</div>
