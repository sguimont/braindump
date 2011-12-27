<sec:ifLoggedIn>
	<jq:jquery>
		 var gradient = {
			 0:    '#f00', // red
			 0.33: '#ff0', // yellow
			 0.66: '#0f0', // green
			 1:    '#00f'  // blue
			};
		 $("#myCanvas").tagcanvas({weight: true, weightMode:'both', weightFrom: 'data-weight', weightSize: 15.0, weightGradient : gradient, shape: 'hcylinder'},'tags') 
	</jq:jquery>
	<h3><g:message code="tags.label" /></h3>
	<div>
		<canvas width="220px" height="440px" id="myCanvas">
		</canvas>
		<div id="tags">
		 	<ul>
		      <g:each var="tag" in="${tags}">
				<li><a href="<g:createLink controller="home" action="search" params="[tag:tag._id]"/>" style="font-size: <g:formatNumber number="${tag.value.count}" maxFractionDigits="0"/>ex" data-weight="<g:formatNumber number="${tag.value.count}" maxFractionDigits="0"/>">${tag._id}</a></li>
		      </g:each>
			</ul>
		</div>
	</div>
</sec:ifLoggedIn>
