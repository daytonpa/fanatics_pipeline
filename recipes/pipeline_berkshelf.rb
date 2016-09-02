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

	remote_file "#{njc['home_dir']}/.berkshelf/Berksfile" do
		owner njc['owner']
		group njc['group']
		source 'https://github.com/daytonpa/pipeline_berksfile/blob/master/Berksfile'
		action :create
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

	chef_gem 'berkshelf' do
		action :install
		compile_time false
	end

end