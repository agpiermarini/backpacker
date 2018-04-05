require 'rails_helper'

describe 'User' do
  context 'with administrative privileges' do
    it 'can can delete user account' do
      user = User.create!(username: "test_user_1", password: "password", email: "test1@email.com")
      admin  = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      within(".user-#{user.id}") do
        find(:xpath, ".//a[i[contains(@class, 'far fa-trash-alt')]]").click
      end

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content("Deleted #{user.username}")
      expect(page).to_not have_content(user.email)
      expect(page).to_not have_content(user.role)
    end
  end
end
