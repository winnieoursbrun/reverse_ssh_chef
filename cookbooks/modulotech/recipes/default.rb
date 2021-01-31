#
# Cookbook:: modulotech
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package 'sshpass' do
  action :install
end

service 'ssh' do
  action [:enable, :start]
end

sshd_server '/etc/sshd_config' do
  sshd_config(
      PasswordAuthentication: 'yes'
    )
end
