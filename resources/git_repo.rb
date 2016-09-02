actions :create, :remove
default_action :create

attribute :repo_name, name_attribute: true, kind_of: String, required: true
attribute :branch, default: '*/master', kind_of: String
attribute :profile, default: nil, kind_of: String, required: true