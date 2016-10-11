require 'spec_helper'

feature 'repo list' do

  let(:c) {double :c, perform: nil, body_str: '[{"name":"airpostJS"},{"name":"oystercard"},{"name":"battle"}]'}

  before do
    allow_any_instance_of(Repos).to receive(:get_API).and_return(c)
  end
  scenario 'displaying repo list' do
    visit '/'
    fill_in('username', with: 'andrea6859')
    click_button 'Submit'
    visit '/repos'

    expect(page).to have_content 'Your Repository List'
  end
end
