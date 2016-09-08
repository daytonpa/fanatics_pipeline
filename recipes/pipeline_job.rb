## Set up chef-repo job per chef-repo ##


# %w( deploy_flix rr_install ).each do |my_cookbook|
# 	pipeline_job my_cookbook do
#		job_name my_cookbook
#   	git_url "https://github.com/daytonpa/#{my_cookbook}.git"
# 		branch 'master'
# 		build_command ''
#	end
# end

file_cache_path = Chef::Config[:file_cache_path]

%w( deploy_flix rr_install ).each do |cookbook_name|

	config_path = ::File.join file_cache_path, "#{cookbook_name}-config.xml"

	template config_path do
    	source 'job-config.xml.erb'
    	variables git_url: "https://github.com/daytonpa/#{cookbook_name}.git",
			build_command: '_knife_commands.sh.erb',
			cookbook: 'fanatics_pipeline'
	end
	jenkins_job cookbook_name do
    	config config_path
	end
end
