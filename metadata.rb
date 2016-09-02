name 'fanatics_pipeline'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures fanatics_pipeline'
long_description 'Installs/Configures fanatics_pipeline'
version '0.1.0'

##  Chef mainained cookbooks  ##
%w{ sysctl yum chef-zero git jenkins pipeline }.each do |cookbook|
	depends cookbook
end

##  My maintained cookbooks  ##
%w( deploy_flix rr_install ).each do |cookbook|
	depends cookbook
end
