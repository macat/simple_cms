require 'spec_helper'

feature 'Country field for admin users' do
  scenario 'Country field on "new" page' do
    visit '/admin_users/new'
    expect(page).to have_content 'Country'
  end
end
