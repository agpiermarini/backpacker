require 'rails_helper'

describe 'User' do
  context 'as an Admin' do
    it 'can delete countries' do
      admin = User.create(username: "username", password: "password", email: "email@email.com", role: 1)
      country = Country.create(name: "United States of America")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_countries_path
      expect(page).to have_content(country.name)
      find(:xpath, ".//a[i[contains(@class, 'far fa-trash-alt')]]").click

      expect(current_path).to eq(admin_countries_path)

      within(".table") do
        expect(page).to_not have_content(country.name)
      end
    end
  end
end
