#
# Cookbook Name:: fanatics_pipeline
# Attributes:: jenkins_install
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos'].tap do |default|

	## Basic Jenkins configurations ##
	default['ipaddress'] = 'http://localhost'
	default['port'] = '8080'
	default['url'] = "#{default['ipaddress']}:#{default['port']}"

	default['jenkins_args'] = nil
	default['java_options'] = nil
	default['host'] = 'localhost'

	## Jenkins Repository ##
	default['repo'].tap do |repo|

		repo['name'] = 'jenkins'
		repo['description'] = 'Jenkins Repository'
		repo['baseurl'] = 'http://pkg.jenkins-ci.org/redhat-stable/'
		repo['repo'] = "#{repo['baseurl']}jenkins.repo"
		repo['gpgkey'] = "#{repo['baseurl']}jenkins.io.key"
		repo['timeout'] = '60'

	end
end