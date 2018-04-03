require 'rails_helper'

describe 'User' do
  describe 'visits countries index page' do
    context 'with administrative privileges' do
      it 'and sees all countries' do
        admin = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)
        #
        # visit '/'
        #
        # click_on "Sign In"
        #
        # fill_in 'username', with: admin.username
        # fill_in 'password', with: admin.password
        # click_on "Sign In"

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_countries_path
        expect(page).to have_content("All Countries")
      end
    end

    context 'with default privileges' do
      it 'and is not allowed to see countries index' do
        user = User.create!(username: "username", password: "password", email: "email@email.com", role: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit admin_countries_path
        expect(page).to_not have_content("All Countries")
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
end
