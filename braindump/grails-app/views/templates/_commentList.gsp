		<g:each status="index" in="${comments}" var="comment">
			<blockquote>
				<p
					>${comment.comment}
		            <a id="deleteCommentButton${index}" style="float: right; margin-right: 20px;" class="btn danger" data-controls-modal="delete-comment-confirm-modal-${index}" data-backdrop="true" data-keyboard="true">x</a> 
				</p>
				<small><prettytime:display date="${comment.dateCreated}" /></small>
			</blockquote>
			<g:render template="/templates/commentConfirmationDeleteDialog" model="[controller:'book', action:'deleteComment', id:book.id, index:index]" />
		</g:each>
