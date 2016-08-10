#
# Cookbook Name:: fanatics_pipeline
# Attributes:: pipeline_job
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
## Default repo job for the Jenkins service
default['jenkins-centos']['job']['cookbook'] = 'https://github.com/daytonpa/deploy_flix'