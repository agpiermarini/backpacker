require 'rails_helper'

describe 'User' do
  describe 'completes login form' do
    it 'successfully signs in' do
      user = User.create!(username: "username", password: "password", email: "email@email.com")

      visit '/'

      click_on "Sign In"

      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      click_on 'Sign In'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.username}!")
    end
  end

  describe 'completes login form with incorrect username or password' do
    it 'and sign in fails' do
      user = User.create!(username: "username", password: "password", email: "email@email.com")

      visit '/'

      click_on "Sign In"

      fill_in 'username', with: user.username
      fill_in 'password', with: "bad_password"

      click_on 'Sign In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Incorrect username and/or password")
    end
  end

  describe 'attempts to log out' do
    it 'and the user session is terminated' do
      user = User.create!(username: "username", password: "password", email: "email@email.com")

      visit '/'

      click_on "Sign In"

      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      click_on 'Sign In'

      within(".navbar") do
        click_on 'Sign Out'
      end

      expect(current_path).to eq(login_path)
    end
  end
end
