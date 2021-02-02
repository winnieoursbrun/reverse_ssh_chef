#
# Cookbook:: modulotech
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

service 'ssh' do
  action [:enable, :start]
end

sshd_server '/etc/ssh/sshd_config' do
  sshd_config(
      PasswordAuthentication: 'yes'
    )
end
