source "https://supermarket.getchef.com"

group :community do
  cookbook 'jenkins'
  cookbook 'java'
  cookbook 'apt'
  cookbook 'yum'
  cookbook 'emacs'
  cookbook 'git'
  cookbook 'chef-zero'
  cookbook 'chef-dk'
  cookbook 'pipeline'
end

group :my_cookbooks do
	cookbook 'rr_install', git: 'https://github.com/daytonpa/rr_install.git'
	cookbook 'deploy_flix', git: 'https://github.com/daytonpa/deploy_flix.git'
end