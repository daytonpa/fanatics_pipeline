#
# Cookbook Name:: fanatics_pipeline
# Attributes:: jenkins_install
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos'].tap do |d|

	## Basic Jenkins configurations ##
	d['ipaddress'] = 'http://127.0.0.1'
	d['port'] = '8080'
	d['url'] = "#{d['ipaddress']}:#{d['port']}"

	d['jenkins_args'] = nil
	d['java_options'] = nil
	d['host'] = 'localhost'

	## Jenkins Repository ##
	d['repo'].tap do |repo|

		repo['name'] = 'jenkins'
		repo['description'] = 'Jenkins Repository'
		repo['baseurl'] = 'http://pkg.jenkins-ci.org/redhat-stable/'
		repo['repo'] = "#{repo['baseurl']}jenkins.repo"
		repo['gpgkey'] = "#{repo['baseurl']}jenkins.io.key"
		repo['timeout'] = '60'

	end
end