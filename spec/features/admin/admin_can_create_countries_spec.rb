require 'rails_helper'

describe 'User' do
  context 'as an Admin' do
    it 'can add a new country' do
      admin = User.create(username: "username", password: "password", email: "email@email.com", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_countries_path
      click_on 'Add New Country'

      fill_in 'country[name]', with: "United States of America"
      click_on 'Create Country'

      expect(current_path).to eq(admin_countries_path)
      expect(page).to have_content("Added United States of America to the countries database")
      expect(page).to have_content("United States of America")
    end
  end
end
