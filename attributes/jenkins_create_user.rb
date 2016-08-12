#
# Cookbook Name:: fanatics_pipeline
# Attributes:: jenkins_create_user
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos'].tap do |d|

	## User ##
	d['user'] = 'jenkins'
	d['comment'] = 'default user'

	## Group and Owner ##
	d['group'] = 'jenkins'
	d['owner'] = 'jenkins'

	## Home and Logs directory ##
	d['home_dir'] = '/var/lib/jenkins'
	d['logs_dir'] = '/var/log/jenkins'

end