		<jq:jquery>
			 $(".editable_textarea").editable("<g:createLink controller="${controller}" action="updateComment" id="${id}"/>", { 
			      type   : 'textarea',
			      submit : 'OK',
			      cancel : 'cancel',
 			        name : 'comment',
 			        id   : 'index'
        	});
		</jq:jquery>
		<g:each status="index" in="${comments}" var="comment">
			<blockquote>
	            <a id="deleteCommentButton${index}" style="float: right; margin-right: 20px;" class="btn danger" data-controls-modal="delete-comment-confirm-modal-${index}" data-backdrop="true" data-keyboard="true">x</a> 
				<p id="${index}" class="editable_textarea comment">${comment.comment}</p>
				<small><prettytime:display date="${(comment.lastUpdated) ?: comment.dateCreated}" /></small>
			</blockquote>
			<g:render template="/templates/commentConfirmationDeleteDialog" model="[controller:controller, action:'deleteComment', id:id, index:index]" />
		</g:each>
