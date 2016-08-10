#
# Cookbook Name:: fanatics_pipeline
# Recipe:: pipeline_berkshelf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

include_recipe 'build-essential'

node['jenkins-centos'].tap do |node|

	## Create the Berkshelf directory ##
	directory "#{node['home_dir']}/.berkshelf" do
		owner node['user']
		group node['group']
		mode 0755
	end

	file "#{node['home_dir']}/.berkshelf/config.json" do
 		content '{"ssl":{"verify": false }}'
  		owner node['user']
  		group node['group']
	end

	chef_gem 'berkshelf' do
		action :install
		compile_time false
	end

end