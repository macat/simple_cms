require 'spec_helper'

describe 'admin_users/new.html.erb' do
  it 'renders a new admin user form' do
    render
    rendered.within('form') do |f|
      expect(f).to have_selector('input#admin_user_first_name')
      expect(f).to have_selector('input#admin_user_last_name')
      expect(f).to have_selector('input#admin_user_email')
      expect(f).to have_selector('input#admin_user_username')
      expect(f).to have_selector('input#admin_user_password')
      expect(f).to have_selector('input#admin_user_country')
    end
  end
end
