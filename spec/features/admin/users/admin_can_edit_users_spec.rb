require 'rails_helper'

describe 'User' do
  context 'with administrative privileges' do
    it 'can edit a users account information and permissions' do
      user_1 = User.create!(username: "test_user_1", password: "password", email: "test1@email.com")
      admin  = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)

      new_username = "new_username"
      new_email    = "new_email"
      new_role     = "admin"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      within(".user-#{user_1.id}") do
        find(:xpath, ".//a[i[contains(@class, 'far fa-edit')]]").click
      end

      fill_in 'user[username]', with: new_username
      fill_in 'user[email]', with: new_email
      select "#{new_role}", from: 'user[role]'
      save_and_open_page
      click_on 'Update User'

      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content(new_username)
      expect(page).to have_content(new_email)
      expect(page).to have_content(new_role)
    end
  end
end
