require 'repos_manager'

describe Repos do

    subject(:repos_manager) {described_class.new("jh2633")}
    let(:c) {double :c, perform: nil, body_str: '{"classes": {"name": "airport","name": "weather"}}'}
    it 'displays a list of repos from user' do
      allow(repos_manager).to receive(:c).and_return(c)
      repos_manager.repo_list

      expect(repo_names).to eq(["airpostJS", "oystercard", "battle"])
    end
end
