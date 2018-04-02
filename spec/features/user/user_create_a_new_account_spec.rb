require 'rails_helper'

describe 'User' do
  describe 'completes a signup form' do
    it 'creates a new account' do
      visit '/'

      click_link "Register"

      user = "new"
      password = "password"
      email = "email@email.com"

      fill_in "user[:username]", with: user
      fill_in "user[:password]", with: password
      fill_in "user[:password_confirmation]", with: password
      fill_in "user[:email]", with: email
      click_on "Submit"

      expect(User.last.username).to eq(user)
      expect(User.last.password).to eq(password)
      expect(User.last.email).to eq(email)
    end
  end
end
