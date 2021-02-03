#
# Cookbook:: modulotech
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package 'openssh-client' do
  action :install
end
package 'openssh-server' do
  action :install
end
service 'ssh' do
  action [:enable, :start]
end

group 'sysadmin'

user 'admin' do
  gid 'sysadmin'
  password '$6$eL7i84d43AZ7Dwqk$Qa.FdwX5sWAEwrKglZg/PRXHVtOhvoo406jyclRN2YyOEgEeT.azbwWul52YXLt9AAZOzJ/HwWfGZxarLKm5q/'
  shell '/bin/bash'
  manage_home true
end

sudo 'admin' do
  groups 'sysadmin'
  nopasswd true
end

sshd_server '/etc/ssh/sshd_config' do
  sshd_config(
      PasswordAuthentication: 'yes'
    )
end
