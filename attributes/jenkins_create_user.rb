#
# Cookbook Name:: fanatics_pipeline
# Attributes:: jenkins_create_user
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos'].tap do |default|

	## User ##
	default['user'] = 'jenkins'
	default['comment'] = 'default user'

	## Group and Owner ##
	default['group'] = 'jenkins'
	default['owner'] = 'jenkins'

	## Home and Logs directory ##
	default['home_dir'] = '/var/lib/jenkins'
	default['logs_dir'] = '/var/log/jenkins'

end