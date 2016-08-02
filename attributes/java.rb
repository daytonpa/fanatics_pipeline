#
# Cookbook Name:: fanatics_pipeline
# Attributes:: java
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#

default['jenkins-centos']['java'].tap do |java|

	java['version'] = 'java-1.7.0-openjdk'

end