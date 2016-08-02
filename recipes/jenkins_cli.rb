#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_cli
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
node['jenkins-centos'].tap do |node|
	## Create the Jenkins plugins directory ##

	# Download the remote Jenkins CLI ##
	# execute 'download_and_install_Jenkins_CLI' do
	# 	command "wget --no-check-certificate #{node['url']}/jnlpJars/jenkins-cli.jar"
	# 	creates "#{node['plugins_dir']}/jenkins-cli.jar"
	# 	action :run
	# 	notifies :restart, "service[#{node['repo']['name']}]", :immediately
	# end

	remote_file "#{node['plugins_dir']}/jenkins-cli.jar" do
		source "#{node['url']}/jnlpJars/jenkins-cli.jar"
		action :create
		ignore_failure true
		mode '0755'
		notifies :restart, "service[#{node['repo']['name']}]", :immediately
	end
end

