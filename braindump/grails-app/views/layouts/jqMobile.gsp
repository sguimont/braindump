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
	<r:require modules="jq-mobile" />
	<r:layoutResources />
	<g:layoutHead />
	<style>
		.label {
			padding: 1px 3px 2px; border-radius: 3px; color: rgb(255, 255, 255); text-transform: uppercase; font-size: 9.75px; font-weight: bold; white-space: nowrap; background-color: rgb(191, 191, 191); -moz-border-radius: 3px; -webkit-border-radius: 3px;
		}
		.important.label {
			background-color: rgb(196, 60, 53);
		}
		.warning.label {
			background-color: rgb(248, 148, 6);
		}
		.success.label {
			background-color: rgb(70, 165, 70);
		}
		.notice.label {
			background-color: rgb(98, 207, 252);
		}
	</style>
</head>
<body>
	<g:layoutBody />
	<r:layoutResources />
</body>
</html>
