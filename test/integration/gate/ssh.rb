describe package('openssh-server') do
  it { should be_installed }
end

describe package('openssh-client') do
  it { should be_installed }
end

describe service('sshd') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe file('/home/vagrant/.ssh/config') do
  it { should exist }
  it { should be_readable.by_user('vagrant') }
  it { should be_owned_by 'vagrant' }
  it { should be_file }
end

describe sshd_config do
  its('PasswordAuthentication') { should cmp 'yes' }
  its('Port') { should cmp 22 }
  its('Protocol') { should cmp 2 }
end
