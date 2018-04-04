require 'rails_helper'

describe 'User' do
  describe 'clicks button to remove image from destination' do
    it 'and it removes the image from the destination show page' do
      user = User.create(username: 'username', password: 'password', email: 'email@email.com')
      country = Country.create(name: 'Thailand')
      destination = user.destinations.create!(title: 'Chiang Mai Night Market', notes: 'Visit the night market during Chiang Mai stay', country_id: country.id)
      image = Image.create(name: "Night Market", url: "http://cdn.theakyra.com/files/2214/5456/0974/Night-Bazaar.jpg")
      destination_image = DestinationImage.create(destination_id: destination.id, image_id: image.id)

      visit destination_path(destination)

      within(".image-#{destination_image.id}") do
        find(:xpath, ".//a[i[contains(@class, 'far fa-trash-alt')]]").click
      end

      expect(page).to have_content("Removed image \"#{image.name}\" from this destination")
    end
  end
end
