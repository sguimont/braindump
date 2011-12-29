		<g:each in="${comments}" var="comment">
			<blockquote>
				<p>${comment.comment}</p>
				<small><prettytime:display date="${comment.dateCreated}" /></small>
			</blockquote>
		</g:each>
