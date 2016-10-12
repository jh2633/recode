require './lib/analysis_classes/classes_less_than_hundred.rb'

describe MethodsLessThanFive do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
  end

  it 'returns information on lengths of methods' do
    expect(analyser.run(@string,nil)).to eq({:average=>2.0, :percentage=>91.67, :absolute=>1})
  end

  it 'returns nil when no string passed' do
    expect(analyser.run('',nil)).to eq(nil)
  end

end
