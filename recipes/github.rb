file "#{node['jenkins-centos']['home_dir']}/.ssh/config" do
	content <<-EOD
	Host github.com
		StrictHostKeyChecking no
	EOD
  	owner node['jenkins']['server']['user']
  	group node['jenkins']['server']['user']
end