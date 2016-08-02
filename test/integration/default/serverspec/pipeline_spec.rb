require 'spec_helper'

describe 'fanatics_pipeline::default' do
	# Serverspec examples can be found at
	# http://serverspec.org/resource_types.html

	%w( autoconf bison flex gcc gcc-c++ gettext kernel-devel
		make m4 ncurses-devel patch ).each do |pkg|
		describe package(pkg) do
			it { should be_installed }
		end
	end

	describe file('/var/lib/jenkins/.berkshelf') do
		it { should exist }
		it { should be_directory }
		it { should be_owned_by 'jenkins' }
		it { should be_grouped_into 'jenkins' }
		it { should be_mode '755' }
	end

	describe file('/var/lib/jenkins/.berkshelf/config.json') do
		it { should exist }
		it { should be_file }
		it { should be_owned_by 'jenkins' }
		it { should be_grouped_into 'jenkins' }
	end

end