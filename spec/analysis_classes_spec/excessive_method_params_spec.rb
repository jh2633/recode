require './lib/analysis_classes/excessive_method_params.rb'

describe ExcessiveMethodParams do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
    @classes = [Airport, Velodrome, Weather]
  end

  it 'returns methods with over four parameters' do
    expect(analyser.run(@string,@classes)).to eq([{:class=>Airport, :method=>:land, :arity=>5}, {:class=>Velodrome, :method=>:land, :arity=>5}])
  end
end
