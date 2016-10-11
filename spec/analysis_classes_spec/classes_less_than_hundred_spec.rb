require './lib/analysis_classes/classes_less_than_hundred.rb'

describe ClassesLessThanHundred do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
  end

  it 'returns information on length of class' do
    expect(analyser.run(@string,nil)).to eq({:average=>58.0, :percentage=>100.0, :absolute=>0})
  end

end
