require 'spec_helper'

describe AdminUser do
  context 'new' do
    let(:params) do
      {
        :first_name            => 'jack',
        :last_name             => 'nimble',
        :email                 => 'nimble_jack@email.com',
        :username              => 'jack_nimble',
        :password              => 'password',
        :password_confirmation => 'password',
        :country               => 'United States of America',
        :capital               => nil
      }
    end

    let(:user) { AdminUser.new params }

    context 'validations' do
      it 'validates the presence of the country attribute' do
        params[:country] = ''
        user.save
        expect(user.errors.full_messages.first).to eq "Country can't be blank"
      end
    end

    context 'hooks' do
      it 'calls CapitalFinder before save unless the country is unchanged' do
        expect(CapitalFinder).to receive(:for).with('United States of America') { 'Washington D.C.' }
        user.save
        expect(user.capital).to eq 'Washington D.C.'

        expect(CapitalFinder).not_to receive(:for)
        user.first_name = 'Jill'
        user.save
        expect(user.capital).to eq 'Washington D.C.'
      end
    end
  end
end
