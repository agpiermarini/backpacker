require 'rails_helper'


describe 'User' do
  describe 'visits destinations index page' do
    it 'and sees only its own destinations' do
      user_1 = User.create(username: "username", password: "password", email: "email@email.com")
      user_2 = User.create(username: "username2", password: "password", email: "email2@email.com")
      country = Country.create(name: "Thailand")
      destination_1 = user_1.destinations.create!(title: "Chiang Mai Night Market", notes: "Visit the night market during Chiang Mai stay", country_id: country.id)
      destination_2 = user_2.destinations.create!(title: "Thom Lod Cave", notes: "One-day tour to Thom Lod Cave", country_id: country.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit destinations_path

      expect(page).to have_content(destination_1.title)
      expect(page).to_not have_content(destination_2.title)
    end
  end
end
