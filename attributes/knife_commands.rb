default['pipeline'].tap do |d|
	
	# non-pipelined berks groups for community cookbook install/upload
	d['berkshelf']['external']['group'] = 'community'

	d['chef_client_cmd'] = '/usr/bin/chef-client'

	d['chefdk']['version'] = 'latest'
	d['github']['server'] = 'github.com'
end