#
# Cookbook:: modulotech
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

directory '/home/admin/.ssh' do
  owner 'admin'
  group 'sysadmin'
  mode '0700'
  action :create
end

template '/home/admin/.ssh/config' do
  source 'ssh/config.erb'
  owner 'admin'
  group 'sysadmin'
  variables(reverse_ssh: node['reverse_ssh'])
end
