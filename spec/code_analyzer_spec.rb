require 'code_analyzer'

describe '#analyse' do
  let(:example_class) {double :analysis_class, new: example_instance, name: 'Test'}
  let(:example_instance) {double :analysis_instance, run: nil}

  before do
    stub_const("ANALYSIS_CLASSES", [example_class])
    file = File.open('./spec/fixtures/testfile.rb')
    string = file.read
    @code_analyzer = Code_analyzer.new(string)
  end

  it 'delegates to analysis classes' do
    expect(example_instance).to receive(:run)
    @code_analyzer.analyse
  end

  it 'rescues on fail' do
    expect{Code_analyzer.new("").analyse}.not_to raise_error
  end

end
