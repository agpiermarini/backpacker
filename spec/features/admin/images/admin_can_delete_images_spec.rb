require 'rails_helper'

describe 'User' do
  context 'as an Admin' do
    it 'can delete images' do
      admin = User.create(username: "username", password: "password", email: "email@email.com", role: 1)
      image_1 = Image.create(name: "Angkor Wat", url: "https://whc.unesco.org/uploads/thumbs/site_0668_0067-750-0-20151104115852.jpg")
      image_2 = Image.create(name: "Apsara Carving", url: "https://media-cdn.tripadvisor.com/media/photo-s/01/8b/b8/59/apsara-carving.jpg")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      within(".image-#{image_2.id}") do
        find(:xpath, ".//a[i[contains(@class, 'far fa-trash-alt')]]").click
      end

      expect(page).to_not have_css(".image-2")
      expect(page).to have_css(".image-1")
    end
  end
end
