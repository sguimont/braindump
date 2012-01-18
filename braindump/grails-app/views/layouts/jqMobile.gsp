<%@page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<meta name="apple-mobile-web-app-capable" content="yes" />
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
	
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/jq.mobi.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.swipe.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.template.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.carousel.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.css3animate.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.drawer.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.passwordBox.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.scroller.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.shake.js"></script> 
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/plugins/jq.selectBox.js"></script> 
	
	<script type="text/javascript" charset="utf-8" src="../js/jqmobi/ui/jq.ui.js"></script> 
	
	<link rel="stylesheet" type="text/css" href="../js/jqmobi/kitchensink/jq.ui.css" />
	
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
		.scrollBar{background:white;}
	    h3 {text-align:center; font-size:35px;}
	    ul.iconLinks li {font-size:12px; font-weight:normal;}
	    .listbutton {
	        display:block;
	        border:1px solid black;
	        color:black;
	        background:orange;
	        border-radius:5px;
	        width:80%;
	        text-decoration:none;
	        text-align:center;
	        margin:auto;
	        margin-bottom:10px;
	        height:30px;
	        line-height:30px;
	    }
	    .class16 {
	        background:green;
	        color:red;
	    }
		.jqmscrollBar {background:white !important;}	
	</style>
	<script type="text/javascript">
		var webRoot="../js/jqmobi/";
	    var init = function(){
		   $.ui.backButtonText="Back";  
		   $.useViewport(320,480);
	    };
	    window.addEventListener("load",init,false);  
		
	    /* This code prevents users from dragging the page */
	    var preventDefaultScroll = function(event) {
	        event.preventDefault();
	        window.scroll(0,0);
	        return false;
	    };
	    document.addEventListener('touchmove', preventDefaultScroll, false);
	
	    /* This code is used to run as soon as appMobi activates */
	    var onDeviceReady = function(){
			AppMobi.device.setRotateOrientation("portrait");
	        AppMobi.device.setAutoRotate(false);
			webRoot=AppMobi.webRoot+"kitchensink/";
		    //hide splash screen
		    AppMobi.device.hideSplashScreen();	
			
	    };

	    document.addEventListener("appMobi.device.ready",onDeviceReady,false);    
		function showHide(obj,objToHide){
			var el=$("#"+objToHide)[0];
			if(obj.className=="expanded"){
				obj.className="collapsed";
			}
			else{
				obj.className="expanded";
			}
			$(el).toggle();
		}
	</script>
	<r:layoutResources />
	<g:layoutHead />
</head>
<body>
	<g:layoutBody />
	<r:layoutResources />
</body>
</html>
