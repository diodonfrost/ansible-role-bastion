# Test bastion setting

sshd_service = 'sshd'
sshd_service = 'ssh' if os.family == "debian"

sshd_configfile = '/etc/ssh/sshd_config'

bastion_shell = '/usr/bin/bastion/shell'

control 'bastion-01' do
  impact 1.0
  title 'sshd service'
  desc 'sshd service should be started'
  describe service(sshd_service) do
    it { should be_running }
  end
end

control 'bastion-02' do
  impact 1.0
  title 'ssh options forcecommand'
  desc 'sshd configuration should be contain ForceCommand /usr/bin/bastion/shell'
  describe file(sshd_configfile) do
    it { should exist }
    it { should be_file }
    its('owner') { should eq 'root' }
    its('content') { should match /ForceCommand \/usr\/bin\/bastion\/shell/ }
  end
end

control 'bastion-03' do
  impact 1.0
  title 'Bastion group'
  desc 'Group bastion shoud be present'
  describe group('bastion') do
    it { should exist }
  end
end

control 'bastion-04' do
  impact 1.0
  title 'Bastion shell'
  desc 'Bastion shell file should be present'
  describe file(bastion_shell) do
    it { should exist }
    it { should be_file }
    its('owner') { should eq 'root' }
    its('sha256sum') { should eq 'e958c4071e5165034ce78bc297ec1cf79572f01e078c6d19b45b8de8120b62a7' }
  end
end
