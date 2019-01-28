# Test bastion setting

sshd_service = 'sshd'
sshd_service = 'ssh' if os.family == "debian"

sshd_configfile = '/etc/ssh/sshd_config'

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
    its('mode') { should cmp '0644' }
    its('content') { should match /ForceCommand \/usr\/bin\/bastion\/shell/ }
  end
end

control 'bastion-03'
  impact 1.0
  title 'Bastion shell'
  desc 'Bastion shell file should be present'
  describe file(bastion_shell) di
    it { should exist }
    its('owner') { should eq 'root' }
    its('mode') { should cmp '0755' }
    its('sha256sum') { should eq
    '0f4b7d8460a54f45aaf384ae290c52f710f1f5eedc145fadda26a082b743b6b1' }
  end
end
