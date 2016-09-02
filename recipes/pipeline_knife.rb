
##  Create the .chef directory  ##
chef_dir = "#{node['jenkins-centos']['home_dir']}/.chef"

directory chef_dir do
	owner node['jenkins-centos']['owner']
	group node['jenkins-centos']['group']
	mode '0755'
end

## Build the knife.rb file for the chef_server
template "#{chef_dir}/knife.rb" do
	cookbook "#{node['jenkins-centos']['home_dir']}/deploy_flix"
	source 'knife.rb.erb'
	owner node['jenkins-centos']['owner']
	group node['jenkins-centos']['group']
	mode '0644'
	# variables(
	# 	chef_serverurl: org['chef_server_url']
	# 	client_node_name: org['client']
	# 	)
end

file "#{chef_dir}/deploy_flix.pem" do
	content 
	owner node['jenkins-centos']['owner']
	group node['jenkins-centos']['group']
	mode '0644'
end