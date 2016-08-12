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

	file "#{njc['home_dir']}/.berkshelf/config.json" do
 		content '{"ssl":{"verify": false }}'
  		owner njc['user']
  		group njc['group']
	end

	chef_gem 'berkshelf' do
		action :install
		compile_time false
	end

end