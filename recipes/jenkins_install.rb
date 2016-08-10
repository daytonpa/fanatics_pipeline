#
# Cookbook Name:: fanatics_pipeline
# Recipe:: jenkins_install.rb
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
# Download the Jenkins repository and key, and install
#
node['jenkins-centos'].tap do |njc|
	
	njc['repo'].tap do |repo|
	
		## Download the Jenkins repo ##
		yum_repository repo['name'] do
			description 	repo['description']
			enabled 		true
			baseurl 		repo['baseurl']
			gpgkey 			repo['gpgkey']
			timeout 		repo['timeout']
		end
		## Install the Jenkins package ##
		yum_package repo['name']
		yum_package 'wget'
	end

	## Set the home directory permissions ##
	directory njc['home_dir'] do
		user 		njc['user']
		group 		njc['group']
		mode 		'0755'
		recursive 	true
	end

	## Start Jenkins service ##
	service njc['repo']['name'] do 
		supports 	status: true, restart: true, reload: true
		action 		[ :enable, :start ]
	end
end
