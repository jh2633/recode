require 'repo_manager'

describe RepoManager do

    subject(:repo_manager) {described_class}
    let(:c) {double :c, perform: nil, body_str: '[{"name":"airpostJS"},{"name":"oystercard"},{"name":"battle"}]'}
    let(:b) {double :b, perform: nil, body_str: '[{"name":"testFile"}]'}
    let(:a) {double :a, perform: nil, body_str: 'This is a test file'}

    it 'returns a list of repos from user' do
      allow(repo_manager).to receive(:get_API).and_return(c)
      expect(repo_manager.make_API_call('tim3tang')).to eq("[{\"name\":\"airpostJS\"},{\"name\":\"oystercard\"},{\"name\":\"battle\"}]")
    end
    it 'returns a list of file in the repo' do
      allow(repo_manager).to receive(:get_API).and_return(b)
      expect(repo_manager.make_API_call('tim3tang','recodeTest')).to eq("[{\"name\":\"testFile\"}]")
    end
    it 'returns body of file content' do
      allow(repo_manager).to receive(:get_API).and_return(a)
      expect(repo_manager.make_API_call('tim3tang','recodeTest','testFile')).to eq('This is a test file')
    end

end
