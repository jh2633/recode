require './lib/analysis_classes/magic_number.rb'

describe MagicNumber do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
  end

  it 'returns global variables' do
    expect(analyser.run(@string,nil)).to eq({number: 1, name: ["landed_planes.length >= 6"]})
  end

  it 'returns nil when no string passed' do
    expect(analyser.run('',nil)).to eq(nil)
  end

end
