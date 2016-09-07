#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_plugins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

node['jenkins-centos'].tap do |n|
	## Create plugin directory ##
	directory n['plugins_dir'] do
		user n['user']
		group n['group']
		mode '0644'
		recursive true
		action :create
	end

	## Install the default plugins and reload the Jenkins service if 	##
	## new plugins are installed, or if installed plugins are modified.	##

	## Install default plugins ##
	n['jenkins_plugins'].each do |plugin|
		remote_file "#{n['plugins_dir']}/#{plugin}" do
			owner n['owner']
			group n['group']
			mode '0755'

			source 	"http://updates.jenkins-ci.org/latest/#{plugin}.hpi"
			action 	:create
			ignore_failure true
		end
	end

	## Install any extra plugins if they exist in the attributes file ##
	if n['extra_plugins'] != nil
		n['extra_plugins'].each do |plugin|
			remote_file "#{n['plugins_dir']}/#{plugin}" do
				owner n['owner']
				group n['group']
				mode '0755'

				source "http://updates.jenkins-ci.org/latest/#{plugin}.hpi"
				action :create
				ignore_failure true
			end
		end
	end
	
	service n['repo']['name'] do
		action :reload
	end
end
