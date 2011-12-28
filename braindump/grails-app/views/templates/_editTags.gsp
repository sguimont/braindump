<g:set var="count" value="${0}" />
<g:each var="tag" in="${tags}">
    <g:textField name="tag" class="small" value="${tag}" />
	<g:set var="count" value="${count + 1}" />
</g:each>
<g:while test="${count < 8}">
    <g:textField name="tag" class="small" />
	<g:set var="count" value="${count + 1}" />
</g:while>
