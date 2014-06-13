require 'spec_helper'

def sign_up
  fill_in 'First name',              with: 'Jack'
  fill_in 'Last name',               with: 'Nimble'
  fill_in 'Email',                   with: 'jack_nimble@email.com'
  fill_in 'Username',                with: 'jack_nimble'
  fill_in 'Password',                with: 'password'
  fill_in 'Password confirmation',   with: 'password'
  select 'United States of America', from: 'Country'
  click_on 'Create Admin User'
end

feature 'Country and capital info for admin users' do
  scenario 'creating & updating an admin user with country & capital info' do
    visit '/admin_users'
    click_on 'Add New Admin User'
    sign_up
    expect(page).not_to have_content('There were problems with the following fields:')
    expect(page).to have_content 'United States of America'
    expect(page).to have_content 'Washington D.C.'

    find('.listing').first(:link, 'Edit').click
    select 'Aruba', from: 'Country'
    click_on 'Update Admin User'
    expect(page).to have_content 'Aruba'
    expect(page).to have_content 'Oranjestad'
  end
end
