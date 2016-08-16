# This recipe will grab an existing repo from GitHub and push it to a chef-server

## Create directory for the GitHub repos ##

## Download the Flix repo from GitHub ##
git 'deploy_flix' do
	user 		node['jenkins-centos']['user']
	group 		node['jenkins-centos']['group']

	destination # folder to be determined at an appropriate time...
	repository 	'git://github.com/daytonpa/deploy_flix.git'
	reference 	'master'
	action 		:sync
	notifies	:run, 'execute[create_cookbook_path_directory]', :immediately
end

## Push cookbook to chef-server ##
execute 'create_cookbook_path_directory' do
	command		'cp /chef-repo/cookbooks/my_cookbooks/deploy_flix/ cookbooks/'
	action		:nothing
	notifies 	:run, 'execute[add_cookbook_to_run_list]', :immediately
	not_if		'knife status | grep deploy_flix'
end

execute 'add_cookbook_to_run_list' do
	command		'knife node run_list add chef-book deploy_flix'
	action		:nothing
end