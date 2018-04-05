require 'rails_helper'

describe 'User' do
  describe 'visits users index page' do
    context 'with administrative privileges' do
      it 'and sees all users' do
        user_1 = User.create!(username: "test_user_1", password: "password", email: "test1@email.com")
        user_2 = User.create!(username: "test_user_2", password: "password", email: "test2@email.com")
        user_3 = User.create!(username: "test_user_3", password: "password", email: "test3@email.com")
        admin  = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_users_path

        expect(page).to have_content("test_user_1")
        expect(page).to have_content("test1@email.com")
        expect(page).to have_content("test_user_2")
        expect(page).to have_content("test2@email.com")
        expect(page).to have_content("test_user_3")
        expect(page).to have_content("test3@email.com")
      end
    end
  end
end
