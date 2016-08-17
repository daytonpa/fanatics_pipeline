# This recipe will grab an existing repo from GitHub and push it to a chef-server

## Create directory for the GitHub repos ##
directory '/var/git_repos' do
	user 		node['jenkins-centos']['user']
	group		node['jenkins-centos']['group']
	mode		'0644'
end

## Initialize git ##
execute 'initialize_git' do
	cwd '/var/git_repos'
	command 'git init .'
	action :run
end

## Download the Flix repo from GitHub ##
git 'var/git_repos/deploy_flix' do
	user 		node['jenkins-centos']['user']
	group 		node['jenkins-centos']['group']

	repository 	'git://github.com/daytonpa/deploy_flix.git'
	reference 	'master'
	action 		:sync
	notifies	:run, 'execute[create_cookbook_path_directory]', :immediately
end

## Push cookbook to chef-server ##
execute 'create_cookbook_path_directory' do
	command		'cp /var/git_repos/deploy_flix/ cookbooks/'
	action		:nothing
	notifies 	:run, 'execute[upload_cookbook]', :immediately
	not_if		'knife status | grep deploy_flix'
end

execute 'upload_cookbook' do
	command 'knife cookbook upload deploy_flix'
	action :nothing
	notifies :run, 'execute[add_cookbook_to_run_list]', :immediately
end

execute 'add_cookbook_to_run_list' do
	command		'knife node run_list add chef-book deploy_flix'
	action		:nothing
end
