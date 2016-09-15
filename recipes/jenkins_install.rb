#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_install.rb
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
# Download the Jenkins repository and key, and install
#
node['jenkins-centos'].tap do |n|

	n['repo'].tap do |repo|

		## Download the Jenkins repo ##
		yum_repository repo['name'] do
			description 	repo['description']
			enabled 		true
			baseurl 		repo['baseurl']
			gpgkey 			repo['gpgkey']
			timeout 		repo['timeout']
		end

		## Install the Jenkins package and immediately start Jenkins ##
		yum_package repo['name'] do
			action :install
			## Start Jenkins service ##
			notifies :start, "service[#{n['repo']['name']}]", :immediately
		end
	end

	## Set the home directory permissions ##
	directory n['home_dir'] do
		user 		n['user']
		group 		n['group']
		mode 		'0755'
		recursive 	true
	end

	service n['repo']['name'] do
		supports 	status: true, restart: true, reload: true
		action 		[:start, :enable]
	end
end
