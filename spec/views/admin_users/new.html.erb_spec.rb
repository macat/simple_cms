require 'spec_helper'

describe 'admin_users/new.html.erb' do
  context 'new admin_user form' do
    before { render }

    it 'password confirmation' do
      rendered.within('form') do |f|
        expect(f).to have_content('Password confirmation')
        expect(f).to have_selector('input#admin_user_password_confirmation')
      end
    end

    it 'country select' do
      rendered.within('form') do |f|
        expect(f).to have_content('Country')
        expect(f).to have_selector('select#admin_user_country')
      end
    end
  end
end
