modules = {
    application {
		dependsOn 'jquery'
		
        resource url:'js/application.js'
		
		resource url:'js/jquery.tagcanvas.js', disposition: 'head'
		
		resource url:'js/jquery.jeditable.js', disposition: 'head'
		resource url:'js/jquery.jeditable.autogrow.js', disposition: 'head'
		resource url:'js/jquery.jeditable.masked.js', disposition: 'head'
		
		resource url:'js/jquery.maskedinput-1.3.js', disposition: 'head'
		resource url:'js/jquery.autogrow.js', disposition: 'head'
		
		resource url:'js/jquery-ui-timepicker-addon.js', disposition: 'head'
		resource url:'css/jquery-ui-timepicker-addon.css', disposition: 'head'
    }
	
	'application-mobile' {
		dependsOn 'jquery-mobile'
		
		resource url:'js/mobile/jquery.mobile.pagination.js', disposition: 'head'
		resource url:'css/mobile/jquery.mobile.pagination.css', disposition: 'head'
	}

	'jq-mobile' {
		resource url:'js/jqmobi/jq.mobi.js', disposition: 'head'
		resource url:'js/jqmobi/ui/jq.ui.js', disposition: 'head'
	}

	'application-jq-mobile' {
		dependsOn 'jq-mobile'
	}
}