require './lib/analysis_classes/public_private_interface.rb'

describe PublicPrivateInterface do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
    @classes = [Airport, Velodrome, Weather]
  end

  it 'identifies lazy poltergeist classes' do
    expect(analyser.run(@string,@classes)).to eq({:number_public=>7, :number_private=>22, :percentage=>31.82})
  end

end
