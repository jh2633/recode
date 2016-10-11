require 'repos_manager'

describe Repos do

    subject(:repos_manager) {described_class.new("jh2633")}
    let(:c) {double :c, perform: nil, body_str: '[{"name":"airpostJS"},{"name":"oystercard"},{"name":"battle"}]'}
    it 'displays a list of repos from user' do
      allow(repos_manager).to receive(:get_API).and_return(c)
      expect(repos_manager.repo_list).to eq(["airpostJS", "oystercard", "battle"])
    end
end
