describe service('reverse-ssh') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe iptables do
  it { should have_rule('-A INPUT -s 10.0.2.2/32 -p tcp -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 22 -j DROP') }
end
