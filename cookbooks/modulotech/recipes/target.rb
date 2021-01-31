#
# Cookbook:: modulotech
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'iptables-ng::install'

systemd_unit 'reverse-ssh.service' do
  content({ Unit: {
      Description: 'reverse-ssh',
      After: 'network.target',
      Wants: 'network-online.target',
  },
  Service: {
      Type: 'simple',
      ExecStart: "sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=no -NR 22#{node['reverse-ssh']['port']}:localhost:22 vagrant@192.168.0.10",
      Restart: 'always',
  },
  Install: {
      WantedBy: 'multi-user.target',
      } })
  action [:create, :enable, :start, :reload_or_restart]
end

iptables_ng_rule 'ssh' do
  rule [
      '--protocol tcp --dport 22 --source 10.0.2.2/32 --jump ACCEPT',
      '--protocol tcp --dport 22 --jump DROP',
    ]
  ip_version 4
  action :create_if_missing
end
