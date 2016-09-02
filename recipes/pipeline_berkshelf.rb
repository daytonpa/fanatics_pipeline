#
# Cookbook Name:: fanatics_pipeline
# Recipe:: pipeline_berkshelf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

include_recipe 'build-essential'

node['jenkins-centos'].tap do |njc|

	## Create the Berkshelf directory ##
	directory "#{njc['home_dir']}/.berkshelf" do
		owner njc['user']
		group njc['group']
		mode 0755
	end

	git "install_Berksfile_from_GitHub" do
		user njc['user']
		group njc['group']

		destination "#{njc['home_dir']}/.berkshelf"
		repository 'https://github.com/daytonpa/pipeline_berksfile.git'
		
		action :sync
		retries 5
	end

	file "#{njc['home_dir']}/.berkshelf/config.json" do
		owner njc['user']
  		group njc['group']

 		content '{"ssl":{"verify": false }}'
	end

	file "#{njc['home_dir']}/.gitconfig" do
		owner njc['owner']
		group njc['group']

		content <<-EOD
		[http]
			sslVerify = false
		EOD
	end
end