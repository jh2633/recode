require 'code_analyzer'

describe '#analyse' do

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    file = file.read
    @code_analyzer = Code_analyzer.new(file)

  end
  it 'returns number of methods less than 5 lines' do
    expect(@code_analyzer.analyse[:methods_less_than_five]).to eq({average: 2.0, percentage: 91.67, absolute: 1})
  end

  it 'returns name of classes under analysis' do
    expect(@code_analyzer.analyse[:classes]).to eq([Airport, Weather, Velodrome])
  end

  it 'returns length of classes' do
    expect(@code_analyzer.analyse[:class_less_than_hundred]).to eq({:average=>58.0, :percentage=>100.0, :absolute=>0})
  end

  it 'returns percentage of public vs private methods' do
    expect(@code_analyzer.analyse[:public_vs_private]).to eq({:number_public=>2, :number_private=>11, :percentage=>18.18})
  end

  it 'identifies lazy classes' do
    expect(@code_analyzer.analyse[:lazy_poltergeist]).to eq({:class=>Weather, :number_methods=>1, :number_attributes=>0})
  end

  it 'identifies inherited classes' do
    expect(@code_analyzer.analyse[:inheritence]).to eq({:parent=>"Airport", :child=>"Velodrome"})
  end

end
