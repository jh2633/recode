require './lib/analysis_classes/lazy_poltergeist.rb'

describe LazyPoltergeist do

  subject(:analyser) {described_class.new}

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    @string = file.read
    @classes = [Airport, Velodrome, Weather]
  end

  it 'identifies lazy poltergeist classes' do
    expect(analyser.run(@string,@classes)).to eq({:class=>Weather, :number_methods=>1, :number_attributes=>0})
  end

end
