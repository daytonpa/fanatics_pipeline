#
# Cookbook Name:: fanatics_pipeline
# Attributes:: jenkins_plugins
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos'].tap do |d|

	## Jenkins plugins directory ##
	d['plugins_dir'] = "#{d['home_dir']}/plugins"

	## Default Jenkins plugins ##
	d['jenkins_plugins'] = %w(scm-api git git-client github-api github chef-identity )

	## Extra plugins (if you want them) ##
	d['extra_plugins'] = %w( chucknorris remote-terminal-access cli-commander )
end