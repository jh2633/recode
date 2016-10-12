require './lib/analysis_classes/inheritence.rb'

describe Inheritence do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
  end

  it 'returns information on class inheritence' do
    expect(analyser.run(@string,nil)).to eq({:parent=>"Airport", :child=>"Velodrome"})
  end

  it 'returns nil when no string passed' do
    expect(analyser.run('',nil)).to eq(nil)
  end

end
