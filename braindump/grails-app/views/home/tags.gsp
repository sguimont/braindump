<!doctype html>
<html>
	<head>
		<jq:jquery>
			 var gradient = {
				 0:    '#f00', // red
				 0.33: '#ff0', // yellow
				 0.66: '#0f0', // green
				 1:    '#00f'  // blue
				};
			 
			 $("#myCanvas").tagcanvas({weight: true, weightMode:'both', weightFrom: 'data-weight', weightSize: 15.0, weightGradient : gradient},'tags') 
		</jq:jquery>
	</head>
	<body>
		<h3>Tags</h3>
		<div>
			<canvas width="300px" height="300px" id="myCanvas">
			</canvas>
			<div id="tags">
			 	<ul>
			      <g:each var="tag" in="${tags}">
					<li><a href="#" style="font-size: <g:formatNumber number="${tag.value.count}" maxFractionDigits="0"/>ex" data-weight="<g:formatNumber number="${tag.value.count}" maxFractionDigits="0"/>">${tag._id}</a></li>
			      </g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
