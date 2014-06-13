require 'spec_helper'

describe AdminUser do
  context 'validations' do
    subject do
      AdminUser.new({
        :first_name            => 'jack',
        :last_name             => 'nimble',
        :email                 => 'nimble_jack@email.com',
        :username              => 'jack_nimble',
        :password              => 'password',
        :password_confirmation => 'password',
        :country               => '',
        :capital               => nil
      })
    end

    it 'validates the presence of the country attribute' do
      subject.save
      expect(subject.errors.full_messages.first).to eq "Country can't be blank"
    end
  end
end
