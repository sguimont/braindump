// environment specific settings
environments {
	development {
		mongo {
			host = 'localhost'
			port = '27017'
			databaseName = 'braindump'
		}    
	}
	test {
		mongo {
			host = 'localhost'
			port = '27017'
			databaseName = 'braindump'
		}   
	}
	production {
		mongo {
			host = 'localhost'
			port = '27017'
			databaseName = 'braindump'
		}
	}
}
