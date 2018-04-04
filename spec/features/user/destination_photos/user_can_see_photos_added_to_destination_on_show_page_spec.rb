require 'rails_helper'


describe 'User' do
  describe 'clicks on one of their destinations' do
    it 'and sees the images they have selected' do
      user = User.create(username: 'username', password: 'password', email: 'email@email.com')
      country = Country.create(name: 'Thailand')
      destination = user.destinations.create!(title: 'Chiang Mai Night Market', notes: 'Visit the night market during Chiang Mai stay', country_id: country.id)
      image = Image.create(name: "Night Market", url: "http://cdn.theakyra.com/files/2214/5456/0974/Night-Bazaar.jpg")
      destination_image = DestinationImage.create(destination_id: destination.id, image_id: image.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit destination_path(destination)

      within(".image-#{destination_image.id}") do
        expect(page).to have_xpath("//img[contains(@src,'Night-Bazaar.jpg')]")
      end
    end
  end
end
