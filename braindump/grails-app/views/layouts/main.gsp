<%@page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<title><g:layoutTitle default="Brain Dump" /></title>
     <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <g:javascript src="excanvas.js" />
    <![endif]-->
	<r:require modules="application, bootstrap, jquery, jquery-ui" />
	<r:layoutResources />
	<g:layoutHead />
	<jq:jquery>
		$(".alert-message").alert()
	</jq:jquery>
    <style type="text/css">
		td.flag {
			width: 38px;
		}

      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; /* 40px to make the container go all the way to the bottom of the topbar */
      }
      .container > footer p {
        text-align: center; /* center align it with the container */
      }
      .container {
        width: 820px; /* downsize our container to make the content feel a bit tighter and more cohesive. NOTE: this removes two full columns from the grid, meaning you only go to 14 columns and not 16. */
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; /* negative indent the amount of the padding to maintain the grid system */
        -webkit-border-radius: 0 0 6px 6px;
           -moz-border-radius: 0 0 6px 6px;
                border-radius: 0 0 6px 6px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

      /* Page header tweaks */
      .page-header {
        background-color: #f5f5f5;
        padding: 20px 20px 10px;
        margin: -20px -20px 20px;
      }

      /* Styles you shouldn't keep as they are for displaying this base example only */
      .content .span10,
      .content .span4 {
        min-height: 500px;
      }
      /* Give a quick and non-cross-browser friendly divider */
      .content .span4 {
        margin-left: 0;
        padding-left: 19px;
        border-left: 1px solid #eee;
      }

      .topbar .btn {
        border: 0;
      }
      
      a:hover {
      	text-decoration: none;
      }
      
      .comment-count {
      	border: #AAA solid 1px;
      	padding: 2px;
      	background-color: white;
      	color: #AAA;
      	margin-left: 10px;
      }
      
      .editable_textarea button {
      	display: block;
      	padding: 0px 10px 10px 0px;
      	margin: 0px 10px 10px 0px;
      	float: left;
      }
      
      .comment {
      	white-space: pre;
      }
    </style>
	<script src="http://js.pusher.com/1.11/pusher.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	    var pusher = new Pusher('e03439ab2e03bc5ebf04');

	    var channel = pusher.subscribe('braindump');
	    channel.bind('application', function(data) {
	      alert(data);
	    });
	    
	    <sec:ifLoggedIn>	    
		    channel.bind('<sec:username/>', function(data) {
				alert(data);
		    });
	    </sec:ifLoggedIn>	    
	</script>
</head>
<body>
    <div class="topbar">
      <div class="fill">
        <div class="container">
          <g:link controller="home" class="brand"><g:message code="application.title"/></g:link>
          <ul class="nav">
            <li id="homeMenu"><g:link controller="home"><g:message code="default.home.label"/></g:link></li>
          <sec:ifLoggedIn>
            <li id="noteMenu"><g:link controller="note"><g:message code="default.notes.label"/></g:link></li>
            <li id="linkMenu"><g:link controller="link"><g:message code="default.links.label"/></g:link></li>
            <li id="bookMenu"><g:link controller="book"><g:message code="default.books.label"/></g:link></li>
            <li id="todoMenu"><g:link controller="todo"><g:message code="default.todos.label"/></g:link></li>
            <li id="contactMenu"><g:link controller="contact"><g:message code="default.contacts.label"/></g:link></li>
            <sec:ifAllGranted roles="ROLE_ADMIN">
				<li class="dropdown" data-dropdown="dropdown">
	              <a class="dropdown-toggle" href="#">Admin</a>
	              <ul class="dropdown-menu">
	                <li><g:link controller="admin">Configuration</g:link></li>
	                <li class="divider"></li>
	                <li><g:link controller="admin" action="backup">Backup Data</g:link></li>
	                <li><a href="#">Import Data</a></li>
	                <li class="divider"></li>
	                <li><g:link controller="SignUp">Signup</g:link></li>
	                <li class="divider"></li>
	                <li><g:link controller="quartz">Quartz</g:link></li>
	                <li><g:link controller="monitoring">Monitoring</g:link></li>
	                <li><a href="#">Statistics</a></li>
	              </ul>
	            </li>
            </sec:ifAllGranted>
            </sec:ifLoggedIn>
          </ul>
          <sec:ifLoggedIn>
          <ul class="nav secondary-nav">
            <li id="profileMenu"><g:link controller="profile" action="edit" id="${sec.loggedInUserInfo(field:'id')}"><g:message code="default.profile.label"/></g:link></li>
            <li><g:link controller="logout"><g:message code="default.logout.label"/> <sec:username/> </g:link></li>
          </ul>
          </sec:ifLoggedIn>
          <sec:ifNotLoggedIn>
	          <form action="${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}" class="pull-right" method="POST">
	            <input class="input-small" type="text" name="j_username" placeholder="Username">
	            <input class="input-small" type="password" name="j_password" placeholder="Password">
                <input name='_spring_security_remember_me' type="hidden" value="true">
	            <button class="btn" type="submit"><g:message code="signin.button"/></button>
	          </form>
          </sec:ifNotLoggedIn>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="content">
        <div class="page-header">
          <h1 id="pageHeader"></h1>
			<g:if test='${flash.error}'>
				<div class="alert-message error">
					<a class="close" href="#">×</a>
					<p>${flash.error}</p>
				</div>
			</g:if>
			<g:if test='${flash.warning}'>
				<div class="alert-message warning">
					<a class="close" href="#">×</a>
					<p>${flash.warning}</p>
				</div>			
			</g:if>
			<g:if test='${flash.info}'>
				<div class="alert-message info">
					<a class="close" href="#">×</a>
					<p>${flash.info}</p>
				</div>			
			</g:if>
        </div>
        <div class="row">
          <div class="span10">
           	<g:layoutBody />
          </div>
          <div class="span4">
			<g:include controller="home" action="tags" />            
          </div>
        </div>
      </div>

      <footer>
        <p>&copy; MushCorp 2011</p>
      </footer>

    </div>
	<r:layoutResources />
  </body>
</html>
