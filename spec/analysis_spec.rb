require 'analysis.rb'

describe 'json parser' do
  it 'passes a string into a json object' do
    json = '{"name":"tom"}'
    expect(Json_parser.parse(json)).to eq({"name"=>"tom"})
  end

  it 'decodes content from base64' do
    content = "IyBDcmVhdGVzIGFuIGFpcnBvcnQgb2JqZWN0IHdoaWNoIGNhbiBsYW5kL3Rh"
    expect(Json_parser.decode(content)).to eq("# Creates an airport object which can land/ta")
  end

end
