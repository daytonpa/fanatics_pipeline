#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_plugins
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

node['jenkins-centos'].tap do |node|
	## Create plugin directory ##
	directory node['plugins_dir'] do
		user node['user']
		group node['group']
		mode '0644'
		recursive true
		action :create
	end

	## Install the default plugins and reload the Jenkins service if 	##
	## new plugins are installed, or if installed plugins are modified.	##

	## Install default plugins ##
	node['jenkins_plugins'].each do |plugin|
		remote_file "#{node['plugins_dir']}/#{plugin}" do
			owner node['owner']
			group node['group']
			mode '0755'

			source 	"http://updates.jenkins-ci.org/latest/#{plugin}.hpi"
			action 	:create
			ignore_failure true

			notifies :reload, "service[#{node['repo']['name']}]", :delayed

		end
	end

	## Install any extra plugins ##
	if node['extra_plugins'] != nil
		node['extra_plugins'].each do |plugin|
			remote_file "#{node['plugins_dir']}/#{plugin}" do
				owner node['owner']
				group node['group']
				mode '0755'

				source "http://updates.jenkins-ci.org/latest/#{plugin}.hpi"
				action :create
				ignore_failure true

				notifies :reload, "service[#{node['repo']['name']}]", :delayed
			end
		end
	end
end
