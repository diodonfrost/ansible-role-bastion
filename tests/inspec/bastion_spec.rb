# Test bastion setting

sshd_service = 'sshd'

control 'bastion-01' do
  impact 1.0
  title 'sshd service'
  desc 'sshd service should be started'
  describe service(sshd_service) do
    it { should be_running }
  end
end
