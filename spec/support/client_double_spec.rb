require './spec/support/client_double'

describe ClientDouble do
  subject(:client_double){described_class.new(nil){|block|}}

  it 'exists' do
    subject.perform
    expect(subject.body_str).to eq('Default Body String')
  end

end
