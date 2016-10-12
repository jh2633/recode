require './lib/analysis_classes/object_orgy.rb'

describe ObjectOrgy do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
    @classes = [Airport, Velodrome, Weather]
  end

  it 'identifies an object orgy' do
    expect(analyser.run(@string,@classes)).to eq([{:class=>Airport, :accessor=>:landed_planes=}, {:class=>Velodrome, :accessor=>:landed_planes=}])
  end

end
