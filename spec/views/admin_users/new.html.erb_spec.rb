require 'spec_helper'

describe 'admin_users/new.html.erb' do
  it 'renders a new admin user form with country select' do
    render
    rendered.within('form') do |f|
      expect(f).to have_content('Country')
      expect(f).to have_selector('select#admin_user_country')
    end
  end
end
