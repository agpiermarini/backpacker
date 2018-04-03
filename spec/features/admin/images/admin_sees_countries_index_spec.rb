require 'rails_helper'

describe 'User' do
  describe 'visits images index page' do
    context 'with administrative privileges' do
      it 'and sees all passport stamps' do
        admin = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_stamps_path
        expect(page).to have_content("All Passport Stamps")
      end
    end

    context 'with default privileges' do
      it 'and is not allowed to see all passport stamps' do
        user = User.create!(username: "username", password: "password", email: "email@email.com", role: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit admin_stamps_path
        expect(page).to_not have_content("All Passport Stamps")
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
end
