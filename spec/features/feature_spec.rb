require 'spec_helper'

feature 'repo list' do
  scenario 'displaying repo list' do
    visit '/index'
    fill_in('Github username', with: 'andrea6859')
    click_button 'Submit'
    visit '/repos'

    expect(page).to have_content 'Your Repository List'
  end
end
