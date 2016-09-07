## Set up chef-repo job per chef-repo ##

create_jenkins_job('deploy_flix',
	'https://github.com/daytonpa/deploy_flix.git',
	'_knife_commands.sh.erb',
	'fanatics_pipeline')
