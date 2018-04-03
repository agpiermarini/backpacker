require 'rails_helper'

describe 'User' do
  describe 'completes login form' do
    it 'successfully logs in' do
      username = "new"
      password = "password"
      email = "email@email.com"
      user = User.create!(username: username, password: password, email: email)

      visit '/'

      click_on "Sign In"

      fill_in 'username', with: username
      fill_in 'password', with: password
      click_on 'Sign In'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{username}!")
    end
  end
end
