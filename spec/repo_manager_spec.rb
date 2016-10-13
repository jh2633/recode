require 'repo_manager'

describe RepoManager do

    subject(:repo_manager) {described_class}

    it 'returns a list of repos from user' do
      allow_any_instance_of(ClientDouble).to receive(:body_str).and_return('[{"name":"airpostJS"},{"name":"oystercard"},{"name":"battle"}]')
      expect(repo_manager.make_API_call('tim3tang')).to eq("[{\"name\":\"airpostJS\"},{\"name\":\"oystercard\"},{\"name\":\"battle\"}]")
    end
    it 'returns a list of file in the repo' do
      allow_any_instance_of(ClientDouble).to receive(:body_str).and_return('[{"name":"testFile"}]')
      expect(repo_manager.make_API_call('tim3tang','recodeTest')).to eq("[{\"name\":\"testFile\"}]")
    end
    it 'returns body of file content' do
      allow_any_instance_of(ClientDouble).to receive(:body_str).and_return('This is a test file')
      expect(repo_manager.make_API_call('tim3tang','recodeTest','testFile')).to eq('This is a test file')
    end

end
