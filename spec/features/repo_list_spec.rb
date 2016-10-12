require 'spec_helper'

feature 'repo list' do

  let(:a) {double :a, perform: nil, body_str: '[{"name":"airpostJS"},{"name":"oystercard"},{"name":"battle"}]'}
  let(:b) {double :b, perform: nil, body_str: '[{"name":"readme.md"},{"name":"recode.rb"},{"name":"test.rb"}]'}
  let(:c) {double :c, perform: nil, body_str: '{"name":"airpostJS","content":"Y2xhc3MgQWlycG9ydA0KICAkREVGQVVMVF9DQVBBQ0lUWSA9IDYNCg0KICBkZWYgaW5pdGlhbGl6ZShvcHRpb25zID0ge30pDQogICAgQGNhcGFjaXR5ID0gb3B0aW9ucy5mZXRjaCg6Y2FwYWNpdHksICRERUZBVUxUX0NBUEFDSVRZKQ0KICAgIEB3ZWF0aGVyID0gb3B0aW9ucy5mZXRjaCg6d2VhdGhlcl9zeXN0ZW0sIG5pbCkNCiAgICBAbGFuZGVkX3BsYW5lcyA9IFtdDQogIGVuZA0KDQogIGRlZiBsYW5kKHBsYW5lKQ0KICAgIHByZV9sYW5kaW5nX2NoZWNrcyhwbGFuZSkNCiAgICBwbGFuZS5sYW5kDQogICAgYWRkX3BsYW5lX3RvX2FpcnBvcnQocGxhbmUpDQogICAgIlRoZSBwbGFuZSBoYXMgbGFuZGVkIHNhZmVseSBhdCB0aGUgYWlycG9ydC4iDQogICAgIyBUaGlzIGlzIGEgZmlsbGVyIGNvbW1lbnQNCiAgICAjIFNvIGlzIHRoaXMNCiAgZW5kDQoNCiAgZGVmIHRha2VvZmYocGxhbmUpDQogICAgcHJlX3Rha2VvZmZfY2hlY2tzKHBsYW5lKQ0KICAgIHBsYW5lLnRha2VvZmYNCiAgICByZW1vdmVfcGxhbmVfZnJvbV9haXJwb3J0KHBsYW5lKQ0KICAgICJUaGUgcGxhbmUgaGFzIHN1Y2Nlc3NmdWxseSB0YWtlbiBvZmYuIg0KICBlbmQNCg0KICBwcml2YXRlDQoNCiAgYXR0cl9yZWFkZXIgOmNhcGFjaXR5LCA6d2VhdGhlciwgOmxhbmRlZF9wbGFuZXMNCg0KICBkZWYgcHJlX2xhbmRpbmdfY2hlY2tzKHBsYW5lKQ0KICAgICJUaGF0IHBsYW5lIGlzIGF0IGFub3RoZXIgYWlycG9ydC4iIGlmIHBsYW5lX2xhbmRlZD8ocGxhbmUpDQogICAgJ0FpcnBvcnQgaXMgZnVsbCwgdGhlIHBsYW5lIGhhcyBkaXZlcnRlZC4nIGlmIGFpcnBvcnRfZnVsbD8NCiAgICAnUG9vciB3ZWF0aGVyIG1lYW5zIHRoZSBwbGFuZSBoYXMgdG8gZGl2ZXJ0LicgdW5sZXNzIHdlYXRoZXJfc2FmZT8NCiAgZW5kDQoNCiAgZGVmIHByZV90YWtlb2ZmX2NoZWNrcyhwbGFuZSkNCiAgICAnVGhhdCBwbGFuZSBpcyBjdXJyZW50bHkgZmx5aW5nJyB1bmxlc3MgcGxhbmVfbGFuZGVkPyhwbGFuZSkNCiAgICAnVGhhdCBwbGFuZSBpcyBhdCBhbm90aGVyIGFpcnBvcnQnIHVubGVzcyBhdF9haXJwb3J0PyhwbGFuZSkNCiAgICAnUG9vciB3ZWF0aGVyIG1lYW5zIHRoZSBwbGFuZSBjYW4gbm90IHRha2VvZmYuJyB1bmxlc3Mgd2VhdGhlcl9zYWZlPw0KICBlbmQNCg0KICBkZWYgYWRkX3BsYW5lX3RvX2FpcnBvcnQocGxhbmUpDQogICAgbGFuZGVkX3BsYW5lcyA8PCBwbGFuZQ0KICBlbmQNCg0KICBkZWYgcmVtb3ZlX3BsYW5lX2Zyb21fYWlycG9ydChwbGFuZSkNCiAgICBsYW5kZWRfcGxhbmVzLmRlbGV0ZShwbGFuZSkNCiAgZW5kDQoNCiAgZGVmIGF0X2FpcnBvcnQ/KHBsYW5lKQ0KICAgIGxhbmRlZF9wbGFuZXMuaW5jbHVkZT8gcGxhbmUNCiAgZW5kDQoNCiAgZGVmIHBsYW5lX2xhbmRlZD8ocGxhbmUpDQogICAgcGxhbmUubGFuZGVkPw0KICBlbmQNCg0KICBkZWYgd2VhdGhlcl9zYWZlPw0KICAgIHdlYXRoZXIuY2hlY2tfc2FmZT8NCiAgZW5kDQoNCiAgZGVmIGFpcnBvcnRfZnVsbD8NCiAgICBsYW5kZWRfcGxhbmVzLmxlbmd0aCA+PSBjYXBhY2l0eQ0KICBlbmQNCmVuZA0KDQpjbGFzcyBXZWF0aGVyDQogIGRlZiBhaXJwb3J0X2Z1bGw/DQogICAgbGFuZGVkX3BsYW5lcy5sZW5ndGggPj0gY2FwYWNpdHkNCiAgZW5kDQplbmQNCg0KY2xhc3MgVmVsb2Ryb21lIDwgQWlycG9ydA0KZW5k"}'}

  before do
    allow_any_instance_of(RepoManager).to receive(:get_API).and_return(a)
    allow_any_instance_of(RepoManager).to receive(:get_files).and_return(b)
    allow_any_instance_of(RepoManager).to receive(:get_content).and_return(c)
  end

  scenario 'displaying repo list' do
    visit '/'
    fill_in('username', with: 'tim3tang')
    click_button 'Submit'
    expect(page).to have_content 'Your Repository List'
  end

  scenario 'Display files in Repository' do
    visit '/repos'
    click_link 'battle'
    expect(page).to have_content 'Your File List'
    expect(page).to have_content 'recode.rb'
  end

scenario 'Display analysis' do
  visit '/repos'
  click_link 'battle'
  click_link 'recode.rb'
  expect(page).to have_content 'Design Analysis'
end


end
