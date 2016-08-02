#
# Cookbook Name:: fanatics_pipeline
# Recipe:: default
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

## Install the yum_repository resource ##
include_recipe 'yum::default'

##  Recipes for setting up and installing Jenkins ##
%w( java jenkins_create_user jenkins_install
	jenkins_plugins jenkins_cli ).each do |recipe|
	puts "Converging recipe #{recipe}..."
	include_recipe "fanatics_pipeline::#{recipe}"
end

# include_recipe 'chef-zero'

## Recipes for building and setting up the pipeline ##
%w( pipeline_berkshelf ).each do |recipe|
	puts "Converging recipe #{recipe}..."
	include_recipe "fanatics_pipeline::#{recipe}"
end