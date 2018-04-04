require 'rails_helper'

describe 'User' do
  context 'as an Admin' do
    it 'can edit images' do
      admin = User.create(username: "username", password: "password", email: "email@email.com", role: 1)
      image = Image.create(name: "Apsara Carvings", url: "https://www.flickr.com/photos/christianhaugen/3435684724")
      new_name = "Apsara Carving"
      new_url = "https://allpointseast.com/wp-content/uploads/2011/09/404_0455-blog1.jpg"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path
      find(:xpath, ".//a[i[contains(@class, 'far fa-edit')]]").click

      expect(current_path).to eq(edit_admin_image_path(image))
      expect(page).to have_content(image.name)

      fill_in 'image[name]', with: new_name
      fill_in 'image[url]', with: new_url
      click_on 'Update Image'

      expect(current_path).to eq(admin_images_path)

      within(".image-#{Image.last.id}") do
        expect(page).to have_content(new_name)
        expect(page).to have_xpath("//img[contains(@src,'404_0455-blog1.jpg')]")
      end
    end
  end
end
