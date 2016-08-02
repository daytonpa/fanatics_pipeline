#
# Cookbook Name:: fanatics_pipeline
# Recipe:: disable_firewall.rb
#
# Copyright (c) 2016 Patrick Dayton, All Rights Reserved.
#
# Disable the firewall
#
node['jenkins-centos'].tap do |node|
	execute 'remove_security_auth_for_Jenkins' do
		command "sudo java -jar jenkins.war http://#{node['ipaddress']}:#{node['port']} --argumentsRealm.roles.$ADMIN_USER=admin"
		action :nothing
		notifies :reload, "service[#{node['repo']['name']}]", :immediately
	end
end
