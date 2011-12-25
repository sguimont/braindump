modules = {
    application {
		dependsOn 'jquery'
		
        resource url:'js/application.js'
		
		resource url:'js/jquery-ui-timepicker-addon.js', disposition: 'head'
		resource url:'css/jquery-ui-timepicker-addon.css', disposition: 'head'
    }
}