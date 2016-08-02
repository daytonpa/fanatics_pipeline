#
# Cookbook Name:: fanatics_pipeline
# Attributes:: jenkins_plugins
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos'].tap do |default|

	## Jenkins plugins directory ##
	default['plugins_dir'] = "#{default['home_dir']}/plugins"

	## Default Jenkins plugins ##
	default['jenkins_plugins'] = %w(scm-api git git-client github-api github chef-identity )

	## Extra plugins (if you want them) ##
	default['extra_plugins'] = %w( chucknorris remote-terminal-access cli-commander )
end