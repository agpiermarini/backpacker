require 'rails_helper'

describe 'User' do
  context 'as an Admin' do
    it 'can add a new image' do
      admin = User.create(username: "username", password: "password", email: "email@email.com", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path
      click_on 'Add New Image'

      fill_in 'image[name]', with: "Khao Sok National Park"
      fill_in 'image[url]', with: "http://www.khaosokroyalcliff.com/wp-content/uploads/khao-sok-resort-package-lake.jpg"
      click_on 'Create Image'

      expect(current_path).to eq(admin_images_path)
      expect(page).to have_content("Added image to the database")
    end
  end
end
