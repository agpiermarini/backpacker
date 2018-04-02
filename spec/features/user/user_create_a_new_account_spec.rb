require 'rails_helper'

describe 'User' do
  describe 'completes a signup form' do
    it 'creates a new account' do
      visit '/'

      click_link "Register"

      expect(current_path).to eq(new_user_path)

      username = "new"
      password = "password"
      email = "email@email.com"

      fill_in "user[username]", with: username
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password
      fill_in "user[email]", with: email
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Account Created")
      expect(page).to have_content("Welcome, #{username}!")
    end
  end
end
