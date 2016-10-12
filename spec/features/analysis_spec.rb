require 'spec_helper'

feature 'feature - analysis' do

  before do
    @json = '{
      "name": "testfile.rb",
      "path": "testfile.rb",
      "sha": "1f30e4a65619c0b35038a9dba2e2442a864a194c",
      "size": 1605,
      "url": "https://api.github.com/repos/Tim3tang/recodeTest/contents/testfile.rb?ref=master",
      "html_url": "https://github.com/Tim3tang/recodeTest/blob/master/testfile.rb",
      "git_url": "https://api.github.com/repos/Tim3tang/recodeTest/git/blobs/1f30e4a65619c0b35038a9dba2e2442a864a194c",
      "download_url": "https://raw.githubusercontent.com/Tim3tang/recodeTest/master/testfile.rb",
      "type": "file",
      "content": "Y2xhc3MgQWlycG9ydAogICRERUZBVUxUX0NBUEFDSVRZID0gNgoKICBkZWYg\naW5pdGlhbGl6ZShvcHRpb25zID0ge30pCiAgICBAY2FwYWNpdHkgPSBvcHRp\nb25zLmZldGNoKDpjYXBhY2l0eSwgJERFRkFVTFRfQ0FQQUNJVFkpCiAgICBA\nd2VhdGhlciA9IG9wdGlvbnMuZmV0Y2goOndlYXRoZXJfc3lzdGVtLCBuaWwp\nCiAgICBAbGFuZGVkX3BsYW5lcyA9IFtdCiAgZW5kCgogIGRlZiBsYW5kKHBs\nYW5lKQogICAgcHJlX2xhbmRpbmdfY2hlY2tzKHBsYW5lKQogICAgcGxhbmUu\nbGFuZAogICAgYWRkX3BsYW5lX3RvX2FpcnBvcnQocGxhbmUpCiAgICAiVGhl\nIHBsYW5lIGhhcyBsYW5kZWQgc2FmZWx5IGF0IHRoZSBhaXJwb3J0LiIKICAg\nICMgVGhpcyBpcyBhIGZpbGxlciBjb21tZW50CiAgICAjIFNvIGlzIHRoaXMK\nICBlbmQKCiAgZGVmIHRha2VvZmYocGxhbmUpCiAgICBwcmVfdGFrZW9mZl9j\naGVja3MocGxhbmUpCiAgICBwbGFuZS50YWtlb2ZmCiAgICByZW1vdmVfcGxh\nbmVfZnJvbV9haXJwb3J0KHBsYW5lKQogICAgIlRoZSBwbGFuZSBoYXMgc3Vj\nY2Vzc2Z1bGx5IHRha2VuIG9mZi4iCiAgZW5kCgogIHByaXZhdGUKCiAgYXR0\ncl9yZWFkZXIgOmNhcGFjaXR5LCA6d2VhdGhlciwgOmxhbmRlZF9wbGFuZXMK\nCiAgZGVmIHByZV9sYW5kaW5nX2NoZWNrcyhwbGFuZSkKICAgICJUaGF0IHBs\nYW5lIGlzIGF0IGFub3RoZXIgYWlycG9ydC4iIGlmIHBsYW5lX2xhbmRlZD8o\ncGxhbmUpCiAgICAnQWlycG9ydCBpcyBmdWxsLCB0aGUgcGxhbmUgaGFzIGRp\ndmVydGVkLicgaWYgYWlycG9ydF9mdWxsPwogICAgJ1Bvb3Igd2VhdGhlciBt\nZWFucyB0aGUgcGxhbmUgaGFzIHRvIGRpdmVydC4nIHVubGVzcyB3ZWF0aGVy\nX3NhZmU/CiAgZW5kCgogIGRlZiBwcmVfdGFrZW9mZl9jaGVja3MocGxhbmUp\nCiAgICAnVGhhdCBwbGFuZSBpcyBjdXJyZW50bHkgZmx5aW5nJyB1bmxlc3Mg\ncGxhbmVfbGFuZGVkPyhwbGFuZSkKICAgICdUaGF0IHBsYW5lIGlzIGF0IGFu\nb3RoZXIgYWlycG9ydCcgdW5sZXNzIGF0X2FpcnBvcnQ/KHBsYW5lKQogICAg\nJ1Bvb3Igd2VhdGhlciBtZWFucyB0aGUgcGxhbmUgY2FuIG5vdCB0YWtlb2Zm\nLicgdW5sZXNzIHdlYXRoZXJfc2FmZT8KICBlbmQKCiAgZGVmIGFkZF9wbGFu\nZV90b19haXJwb3J0KHBsYW5lKQogICAgbGFuZGVkX3BsYW5lcyA8PCBwbGFu\nZQogIGVuZAoKICBkZWYgcmVtb3ZlX3BsYW5lX2Zyb21fYWlycG9ydChwbGFu\nZSkKICAgIGxhbmRlZF9wbGFuZXMuZGVsZXRlKHBsYW5lKQogIGVuZAoKICBk\nZWYgYXRfYWlycG9ydD8ocGxhbmUpCiAgICBsYW5kZWRfcGxhbmVzLmluY2x1\nZGU/IHBsYW5lCiAgZW5kCgogIGRlZiBwbGFuZV9sYW5kZWQ/KHBsYW5lKQog\nICAgcGxhbmUubGFuZGVkPwogIGVuZAoKICBkZWYgd2VhdGhlcl9zYWZlPwog\nICAgd2VhdGhlci5jaGVja19zYWZlPwogIGVuZAoKICBkZWYgYWlycG9ydF9m\ndWxsPwogICAgbGFuZGVkX3BsYW5lcy5sZW5ndGggPj0gY2FwYWNpdHkKICBl\nbmQKZW5kCgpjbGFzcyBXZWF0aGVyCiAgZGVmIGFpcnBvcnRfZnVsbD8KICAg\nIGxhbmRlZF9wbGFuZXMubGVuZ3RoID49IGNhcGFjaXR5CiAgZW5kCmVuZAoK\nY2xhc3MgVmVsb2Ryb21lIDwgQWlycG9ydAplbmQK\n",
      "encoding": "base64",
      "_links": {
        "self": "https://api.github.com/repos/Tim3tang/recodeTest/contents/testfile.rb?ref=master",
        "git": "https://api.github.com/repos/Tim3tang/recodeTest/git/blobs/1f30e4a65619c0b35038a9dba2e2442a864a194c",
        "html": "https://github.com/Tim3tang/recodeTest/blob/master/testfile.rb"
      }
    }'

  end
  scenario 'displaying analysis' do
    allow(RepoManager).to receive(:make_API_call).and_return('[{"name":"testRepo"}]')
    visit '/'
    fill_in('username', with: 'tim3tang')
    click_button 'Submit'
    allow(RepoManager).to receive(:make_API_call).and_return('[{"name":"testFile"}]')
    click_link 'testRepo'
    allow(RepoManager).to receive(:make_API_call).and_return(@json)
    click_link 'testFile'
    expect(page).to have_content("Lazy Poltergeist")
    expect(page).to have_content("Inheritence Over Composition")
    expect(page).to have_content("Global Variable")
    expect(page).to have_content("Mega Methods")
    expect(page).to have_content("Waffling Classes")
    expect(page).to have_content("Indecent Exposure")
  end
end
