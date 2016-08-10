name 'fanatics_pipeline'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures fanatics_pipeline'
long_description 'Installs/Configures fanatics_pipeline'
version '0.1.0'

%w{ sysctl yum chef-zero git }.each do |cookbook|
	depends cookbook
end