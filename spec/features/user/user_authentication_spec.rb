require 'rails_helper'

describe 'User' do
  describe 'completes login form' do
    it 'successfully signs in' do
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

  describe 'completes login form with incorrect username or password' do
    it 'and sign in fails' do
      username = "new"
      password = "password"
      bad_password = "123456"
      email = "email@email.com"
      user = User.create!(username: username, password: password, email: email)

      visit '/'

      click_on "Sign In"

      fill_in 'username', with: username
      fill_in 'password', with: bad_password
      click_on 'Sign In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Incorrect username and/or password")
    end
  end
end
