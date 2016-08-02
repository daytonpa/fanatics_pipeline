#
# Cookbook Name:: fanatics_pipeline
# Recipe:: default
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
#     The default CentOS version of Java is not compatible 
# with Jenkins. Jenkins typically works best with a Sun 
# implementation of Java, which is not included in CentOS for 
# licensing reasons.  Womp.
#
# Install a newer version of Java for CentOS
#

yum_package node['jenkins-centos']['java']['version'] do
	action 		:install
end