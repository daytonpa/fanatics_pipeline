## Set up chef-repo job per chef-repo ##


# %w( deploy_flix rr_install ).each do |my_cookbook|
# 	pipeline_job my_cookbook do
#		job_name my_cookbook
#   	git_url "https://github.com/daytonpa/#{my_cookbook}.git"
# 		branch 'master'
# 		build_command ''
#	end
# end

pipeline_job 'deploy_flix' do
	job_name 'deploy_flix'
	git_url 'https://github.com/daytonpa/deploy_flix.git'
	branch 'master'
	build_command 'create'
end
