require 'rails_helper'

describe "Admin" do
  describe 'visits countries index page' do
    it 'and sees all countries' do
      admin = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)

      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_countries_path
      expect(page).to have_content("All Countries")
    end
  end
end
