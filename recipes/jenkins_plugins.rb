#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_plugins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

node['jenkins-centos'].tap do |njc|
	## Create plugin directory ##
	directory njc['plugins_dir'] do
		user njc['user']
		group njc['group']
		mode '0644'
		recursive true
		action :create
	end

	## Install the default plugins and reload the Jenkins service if 	##
	## new plugins are installed, or if installed plugins are modified.	##

	## Install default plugins ##
	njc['jenkins_plugins'].each do |plugin|
		remote_file "#{njc['plugins_dir']}/#{plugin}" do
			owner njc['owner']
			group njc['group']
			mode '0755'

			source 	"http://updates.jenkins-ci.org/latest/#{plugin}.hpi"
			action 	:create
			ignore_failure true

			notifies :reload, "service[#{njc['repo']['name']}]", :delayed

		end
	end

	## Install any extra plugins if they exist in the attributes file ##
	if njc['extra_plugins'] != nil
		njc['extra_plugins'].each do |plugin|
			remote_file "#{njc['plugins_dir']}/#{plugin}" do
				owner njc['owner']
				group njc['group']
				mode '0755'

				source "http://updates.jenkins-ci.org/latest/#{plugin}.hpi"
				action :create
				ignore_failure true

				notifies :reload, "service[#{njc['repo']['name']}]", :delayed
			end
		end
	end
end
