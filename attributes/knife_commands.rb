default['pipeline'].tap do |default|
	
	# non-pipelined berks groups for community cookbook install/upload
	default['berkshelf']['external']['group'] = 'community'

	default['chef_client_cmd'] = '/usr/bin/chef-client'

	default['chefdk']['version'] = 'latest'
	default['github']['server'] = 'github.com'
end