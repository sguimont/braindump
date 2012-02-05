// environment specific settings
environments {
	development {
		grails		{
			mongo {
				host = 'localhost'
				port = '27017'
				databaseName = 'braindump'
			}
		}
	}
	test {
		grails		{
			mongo {
				host = 'localhost'
				port = '27017'
				databaseName = 'braindump'
			}
		}
	}
	production {
		grails		{
			mongo {
				host = 'mongodb-braindump.jelastic.servint.net'
				port = '27017'
				databaseName = 'braindump'
				username = 'braindump'
				password = 'braindump'
			}
		}
	}
}
