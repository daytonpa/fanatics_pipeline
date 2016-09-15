#
# Cookbook Name:: jenkins-bot
# Recipe:: jenkins_create_user.rb
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
# Create the jenkins user and group
#
# User
user node['jenkins-centos']['user'] do
	comment node['jenkins-centos']['comment']
	home node['jenkins-centos']['home_dir']
end

# Group
group node['jenkins-centos']['group'] do
	members node['jenkins-centos']['user']
end
