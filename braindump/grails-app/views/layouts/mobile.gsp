<%@page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title><g:layoutTitle default="Brain Dump" /></title>
	<script src="http://js.pusher.com/1.11/pusher.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	    var pusher = new Pusher('e03439ab2e03bc5ebf04');
	
	    var channel = pusher.subscribe('braindump');
	    channel.bind('application', function(data) {
	      alert("Application\n\n" + data);
	    });
	    
	    <sec:ifLoggedIn>	    
		    channel.bind('<sec:username/>', function(data) {
				alert("User\n\n" + data);
		    });
	    </sec:ifLoggedIn>	    
	</script>
	<r:require modules="bootstrap, jquery-mobile, application-mobile" />
	<r:layoutResources />
	<g:layoutHead />
	<style>
		h1 {
			color: white;
		}
		
		.right-note {
			white-space: nowrap; 
			margin-right: 20px; 
			color: #AAA;
		}
	</style>
</head>
<body>
	<g:layoutBody />
	<r:layoutResources />
</body>
</html>
