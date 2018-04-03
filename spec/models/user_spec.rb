require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :username}
    it {should validate_uniqueness_of :username}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :username}
  end

  describe 'roles' do
    it 'a user role is default by default' do
      user = User.create!(username: "username", password: "password", email: "email@email.com")

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it 'a user can be created with admin privilegs' do
      user = User.create!(username: "username", password: "password", email: "email@email.com", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
  end
end
