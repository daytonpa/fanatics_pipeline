require 'spec_helper'

describe 'fanatics_pipeline::default' do
	# Serverspec examples can be found at
	# http://serverspec.org/resource_types.html
  	describe file('/var/lib/jenkins/plugins') do
    	it { should exist }
    	it { should be_directory }
    	it { should be_owned_by 'jenkins' }
    	it { should be_grouped_into 'jenkins' }
    	it { should be_mode '644'}
    end

    describe file('/var/lib/jenkins/plugins/jenkins-cli.jar') do
        it { should exist }
        it { should be_file }
        it { should be_mode '755' }
        it { should be_executable }
    end

    ##  All them good 'ol plugins  ##
	%w( scm-api git git-client github-api github chef-identity chucknorris 
        remote-terminal-access cli-commander ).each do |plugin|
		describe file("/var/lib/jenkins/plugins/#{plugin}") do
			it { should exist }
			it { should be_file }
            it { should be_owned_by 'jenkins' }
            it { should be_mode '755' }
            it { should be_executable }
		end
	end
end
