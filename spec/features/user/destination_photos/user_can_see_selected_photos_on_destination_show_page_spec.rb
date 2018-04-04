require 'rails_helper'


describe 'User' do
  describe 'clicks on one of their destinations' do
    it 'and sees the images they have selected' do
      user = User.create(username: 'username', password: 'password', email: 'email@email.com')
      country = Country.create(name: 'Thailand')
      destination = user.destinations.create!(title: 'Chiang Mai Night Market', notes: 'Visit the night market during Chiang Mai stay', country_id: country.id)
      image = Image.create(name: "Night Market", url: "http://cdn.theakyra.com/files/2214/5456/0974/Night-Bazaar.jpg")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit destinations_path
      click_on 'Chiang Mai Night Market'
      click_on 'Add Images'

      expect(current_path).to eq(destination_images_path(destination))

      within(".image-#{image.id}") do
        find(:xpath, ".//a[i[contains(@class, 'far fa-plus-square')]]").click
      end

      expect(current_path).to eq(destinations_path)

      within(".image-#{image.id}") do
        expect(page).to have_xpath("//img[contains(@src,'Night-Bazaar.jpg')]")
      end
    end
  end
end
