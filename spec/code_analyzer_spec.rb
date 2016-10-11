require 'code_analyzer'

describe 'code has less than 5 lines' do

  before do
    file = File.open('./spec/fixtures/testfile.rb')
    file = file.read
    @code_analyzer = Code_analyzer.new(file)

  end

  it 'returns % of methods less than 5 lines' do
    expect(@code_analyzer.meth_less_than_five).to eq([3, 4, 4, 3, 3, 1, 1, 1, 1, 1, 1])
  end
end
