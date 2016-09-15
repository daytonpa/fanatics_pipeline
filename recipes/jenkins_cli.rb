#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_cli
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
node['jenkins-centos'].tap do |njc|
	## Create the Jenkins plugins directory ##

	# Download the remote Jenkins CLI ##
	# execute 'download_and_install_Jenkins_CLI' do
	# 	command "wget --no-check-certificate #{njc['url']}/jnlpJars/jenkins-cli.jar"
	# 	creates "#{njc['plugins_dir']}/jenkins-cli.jar"
	# 	action :run
	# 	notifies :restart, "service[#{njc['repo']['name']}]", :immediately
	# end

	remote_file "#{njc['plugins_dir']}/jenkins-cli.jar" do
		source "#{njc['url']}/jnlpJars/jenkins-cli.jar"
		action :create
		ignore_failure false
		mode '0755'
		notifies :restart, "service[#{njc['repo']['name']}]", :immediately
	end

	jenkins_user node['jenkins-centos']['user']

end
