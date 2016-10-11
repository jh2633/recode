require 'json_parser.rb'

describe 'json parser' do
  it 'passes a string into a json object' do
    json = '{"name":"tom"}'
    expect(Json_parser.parse(json)).to eq({"name"=>"tom"})
  end

  it 'decodes content from base64' do
    content = "IyBDcmVhdGVzIGFuIGFpcnBvcnQgb2JqZWN0IHdoaWNoIGNhbiBsYW5kL3Rh"
    expect(Json_parser.decode(content)).to eq("# Creates an airport object which can land/ta")
  end

  it 'passes a decoded string from json object' do
    json = '{
  "name": "airport.rb",
  "path": "AirportTestFiles/airport.rb",
  "sha": "ff1bbec93e3f540c60d93cbfd41654bd013eba83",
  "size": 1516,
  "url": "https://api.github.com/repos/TomStuart92/DOMMapper/contents/AirportTestFiles/airport.rb?ref=master",
  "html_url": "https://github.com/TomStuart92/DOMMapper/blob/master/AirportTestFiles/airport.rb",
  "git_url": "https://api.github.com/repos/TomStuart92/DOMMapper/git/blobs/ff1bbec93e3f540c60d93cbfd41654bd013eba83",
  "download_url": "https://raw.githubusercontent.com/TomStuart92/DOMMapper/master/AirportTestFiles/airport.rb",
  "type": "file",
  "content": "IyBDcmVhdGVzIGFuIGFpcnBvcnQgb2JqZWN0IHdoaWNoIGNhbiBsYW5kL3Rh\na2VvZmYgcGxhbmUgb2JqZWN0cy4KY2xhc3MgQWlycG9ydAogIERFRkFVTFRf\nQ0FQQUNJVFkgPSA2CgogIGRlZiBpbml0aWFsaXplKG9wdGlvbnMgPSB7fSkK\nICAgIEBjYXBhY2l0eSA9IG9wdGlvbnMuZmV0Y2goOmNhcGFjaXR5LCBERUZB\nVUxUX0NBUEFDSVRZKQogICAgQHdlYXRoZXIgPSBvcHRpb25zLmZldGNoKDp3\nZWF0aGVyX3N5c3RlbSwgV2VhdGhlci5uZXcpCiAgICBAbGFuZGVkX3BsYW5l\ncyA9IFtdCiAgZW5kCgogIGRlZiBsYW5kKHBsYW5lKQogICAgcHJlX2xhbmRp\nbmdfY2hlY2tzKHBsYW5lKQogICAgcGxhbmUubGFuZAogICAgYWRkX3BsYW5l\nX3RvX2FpcnBvcnQocGxhbmUpCiAgICAiVGhlIHBsYW5lIGhhcyBsYW5kZWQg\nc2FmZWx5IGF0IHRoZSBhaXJwb3J0LiIKICBlbmQKCiAgZGVmIHRha2VvZmYo\ncGxhbmUpCiAgICBwcmVfdGFrZW9mZl9jaGVja3MocGxhbmUpCiAgICBwbGFu\nZS50YWtlb2ZmCiAgICByZW1vdmVfcGxhbmVfZnJvbV9haXJwb3J0KHBsYW5l\nKQogICAgIlRoZSBwbGFuZSBoYXMgc3VjY2Vzc2Z1bGx5IHRha2VuIG9mZi4i\nCiAgZW5kCgogIHByaXZhdGUKCiAgYXR0cl9yZWFkZXIgOmNhcGFjaXR5LCA6\nd2VhdGhlciwgOmxhbmRlZF9wbGFuZXMKCiAgZGVmIHByZV9sYW5kaW5nX2No\nZWNrcyhwbGFuZSkKICAgICJUaGF0IHBsYW5lIGlzIGF0IGFub3RoZXIgYWly\ncG9ydC4iIGlmIHBsYW5lX2xhbmRlZD8ocGxhbmUpCiAgICAnQWlycG9ydCBp\ncyBmdWxsLCB0aGUgcGxhbmUgaGFzIGRpdmVydGVkLicgaWYgYWlycG9ydF9m\ndWxsPwogICAgJ1Bvb3Igd2VhdGhlciBtZWFucyB0aGUgcGxhbmUgaGFzIHRv\nIGRpdmVydC4nIHVubGVzcyB3ZWF0aGVyX3NhZmU/CiAgZW5kCgogIGRlZiBw\ncmVfdGFrZW9mZl9jaGVja3MocGxhbmUpCiAgICAnVGhhdCBwbGFuZSBpcyBj\ndXJyZW50bHkgZmx5aW5nJyB1bmxlc3MgcGxhbmVfbGFuZGVkPyhwbGFuZSkK\nICAgICdUaGF0IHBsYW5lIGlzIGF0IGFub3RoZXIgYWlycG9ydCcgdW5sZXNz\nIGF0X2FpcnBvcnQ/KHBsYW5lKQogICAgJ1Bvb3Igd2VhdGhlciBtZWFucyB0\naGUgcGxhbmUgY2FuIG5vdCB0YWtlb2ZmLicgdW5sZXNzIHdlYXRoZXJfc2Fm\nZT8KICBlbmQKCiAgZGVmIGFkZF9wbGFuZV90b19haXJwb3J0KHBsYW5lKQog\nICAgbGFuZGVkX3BsYW5lcyA8PCBwbGFuZQogIGVuZAoKICBkZWYgcmVtb3Zl\nX3BsYW5lX2Zyb21fYWlycG9ydChwbGFuZSkKICAgIGxhbmRlZF9wbGFuZXMu\nZGVsZXRlKHBsYW5lKQogIGVuZAoKICBkZWYgYXRfYWlycG9ydD8ocGxhbmUp\nCiAgICBsYW5kZWRfcGxhbmVzLmluY2x1ZGU/IHBsYW5lCiAgZW5kCgogIGRl\nZiBwbGFuZV9sYW5kZWQ/KHBsYW5lKQogICAgcGxhbmUubGFuZGVkPwogIGVu\nZAoKICBkZWYgd2VhdGhlcl9zYWZlPwogICAgd2VhdGhlci5jaGVja19zYWZl\nPwogIGVuZAoKICBkZWYgYWlycG9ydF9mdWxsPwogICAgbGFuZGVkX3BsYW5l\ncy5sZW5ndGggPj0gY2FwYWNpdHkKICBlbmQKZW5kCg==\n",
  "encoding": "base64",
  "_links": {
    "self": "https://api.github.com/repos/TomStuart92/DOMMapper/contents/AirportTestFiles/airport.rb?ref=master",
    "git": "https://api.github.com/repos/TomStuart92/DOMMapper/git/blobs/ff1bbec93e3f540c60d93cbfd41654bd013eba83",
    "html": "https://github.com/TomStuart92/DOMMapper/blob/master/AirportTestFiles/airport.rb"
  }
}'
decoded = Json_parser.extract(json)
expect(decoded).to include("# Creates an airport object which can land/ta")
  end

end
