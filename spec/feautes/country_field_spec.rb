require 'spec_helper'

feature 'Country field for admin users' do
  scenario 'Country field on "new" page' do
    visit '/admin_users/new'
    fill_in 'First name',              with: 'Jack'
    fill_in 'Last name',               with: 'Nimble'
    fill_in 'Email',                   with: 'jack_nimble@email.com'
    fill_in 'Username',                with: 'jack_nimble'
    fill_in 'Password',                with: 'password'
    fill_in 'Password confirmation',   with: 'password'
    select 'United States of America', from: 'Country'
    click_on 'Create Admin User'
  end
end
