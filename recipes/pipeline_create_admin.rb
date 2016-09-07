home = node['jenkins-centos']['home_dir']

##  Change the Jenkins config to disable security.  ##
template 'create_disabled_security_jenkins_config' do
    owner node['jenkins-centos']['user']
    group node['jenkins-centos']['group']
    mode '0755'

    path "#{home}/config.xml"
    source 'config_disable_security.xml.erb'
    action :nothing

    subscribes :create, "yum_package[#{node['jenkins-centos']['repo']['name']}]", :immediately
    notifies :restart, "service[#{node['jenkins-centos']['repo']['name']}]", :immediately
    # /recipes/pipeline_admin.rb
    notifies :run, 'execute[create_new_admin_for_pipeline_jobs]', :immediately
end

##  Add the user as an admin.  ##
execute 'create_new_admin_for_pipeline_jobs' do
    command "java -jar jenkins.war --argumentsRealm.passwd.#{node['jenkins-centos']['user']}=#{node['jenkins-centos']['password']} --argumentsRealm.roles.#{node['jenkins-centos']['user']}=admin"
    action :nothing

    notifies :delete, 'template[delete_disabled_security_jenkins_config]', :immediately
end

##  Delete the Jenkins disabled security config file.  ##
template 'delete_disabled_security_jenkins_config' do
    action :nothing
    path "#{home}/config.xml"

    notifies :create, "template[create_enabled_security_jenkins_config]", :immediately
    subscribes :delete, 'execute[create_new_admin_for_pipeline_jobs]', :immediately
end

##  Create the Jenkins config to enable security.  ##
template 'create_enabled_security_jenkins_config' do
    owner node['jenkins-centos']['user']
    group node['jenkins-centos']['group']
    mode '0755'

    path "#{home}/config.xml"
    source 'config_enable_security.xml.erb'
    action :nothing

    subscribes :create,
    notifies :restart, "service[#{node['jenkins-centos']['repo']['name']}]", :immediately
end
