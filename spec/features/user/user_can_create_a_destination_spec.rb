require 'rails_helper'

describe 'User' do
  describe 'completes destination form' do
    it 'and creates a destination' do
      user = User.create(username: "username", password: "password", email: "email@email.com")
      country = Country.create(name: "Thailand")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_destination_path

      fill_in 'destination[title]', with: 'Khao Sok National Park'
      select "Thailand", from: 'destination[country_id]'
      fill_in 'destination[notes]', with: 'Two-day tour with overnight stay in the floating bungalows.'
      click_on 'Create Destination'

      expect(current_path).to eq(destinations_path)
      expect(page).to have_content("#{Destination.last.title}")
      expect(page).to have_content(country.name)
    end
  end
end
