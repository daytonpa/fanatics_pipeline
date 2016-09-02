#
# Cookbook Name:: fanatics_pipeline
# Recipe:: default
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
## Install the yum_repository resource, git resource, chef-zero, and sysctl ##

include_recipe 'yum::default'
include_recipe 'sysctl::default'
include_recipe 'git'
include_recipe 'chef-zero'
 
##  Install wget  ##
yum_package 'wget'

sysctl_param 'net.ipv6.conf.all.disable_ipv6' do
	value 1
end

##  Recipes for setting up and installing Jenkins ##
%w( java jenkins_create_user jenkins_install
	jenkins_plugins jenkins_cli ).each do |recipe|
	puts "Converging recipe #{recipe}..."
	include_recipe "fanatics_pipeline::#{recipe}"
end

## Recipes for building and setting up the pipeline ##
%w( pipeline_berkshelf pipeline_job ).each do |recipe|
	puts "Converging recipe #{recipe}..."
	include_recipe "fanatics_pipeline::#{recipe}"
end