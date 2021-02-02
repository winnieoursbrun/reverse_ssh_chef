#
# Cookbook:: modulotech
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

template '/home/vagrant/.ssh/config' do
  source 'ssh/config.erb'
  owner 'vagrant'
  group 'vagrant'
  variables(reverse_ssh: node['reverse_ssh'])
end
