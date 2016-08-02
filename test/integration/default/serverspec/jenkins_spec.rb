require 'spec_helper'

describe 'fanatics_pipeline::default' do
	# Serverspec examples can be found at
	# http://serverspec.org/resource_types.html

	# Tests for Jenkins

	## User and Group ##
 	describe group('jenkins') do
  		it { should exist }
  	end
    
    describe user('jenkins') do
  		it { should exist }
  		it { should belong_to_group 'jenkins' }
  	end


  	## Directories and Repositories ##
  	describe file('/etc/yum.conf') do
  		it { should exist }
  	end

  	describe file('/etc/yum.repos.d') do
  		it { should exist }
        it { should be_directory }
  	end

    describe file('/etc/sysconfig/jenkins') do
        it { should exist }
        it { should be_file }
    end

  	describe file('/var/log/jenkins') do
  		it { should exist }
  		it { should be_directory }
  	end

  	describe file('/var/lib/jenkins') do
  		it { should exist }
  		it { should be_directory }
  		it { should be_owned_by 'jenkins' }
  		it { should be_grouped_into 'jenkins' }
  		it { should be_mode '755' }
  	end

  	describe yumrepo('jenkins') do
  		it { should exist }
  		it { should be_enabled }
  	end

  	## Packages ##
  	describe package('java-1.7.0-openjdk') do
  		it { should be_installed }
  	end

  	describe package('jenkins') do
  		it { should be_installed }
  	end

  	## Ports ##
  	describe port('8080') do
  		it { should be_listening }
  		it { should be_listening.on('0.0.0.0') }
  	end

  	## Services ##
  	describe service('jenkins') do
  		it { should be_running }
  	end
end
