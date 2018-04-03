require 'rails_helper'

describe 'User' do
  context 'as an Admin' do
    it 'can edit countries' do
      admin = User.create(username: "username", password: "password", email: "email@email.com", role: 1)
      country = Country.create(name: "United Sates of America")
      new_name = "United States of America"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_countries_path
      find(:xpath, ".//a[i[contains(@class, 'far fa-edit')]]").click

      expect(current_path).to eq(edit_admin_country_path(country))
      expect(page).to have_content(country.name)

      fill_in 'country[name]', with: new_name
      click_on 'Update Country'

      expect(current_path).to eq(admin_countries_path)
      expect(page).to_not have_content(country.name)
      expect(page).to have_content(new_name)
    end
  end
end
