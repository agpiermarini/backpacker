require 'rails_helper'


describe 'User' do
  describe 'clicks on link to add image to destination' do
    it 'and it adds the image to their destination' do
      user = User.create(username: 'username', password: 'password', email: 'email@email.com')
      country = Country.create(name: 'Thailand')
      destination = user.destinations.create!(title: 'Chiang Mai Night Market', notes: 'Visit the night market during Chiang Mai stay', country_id: country.id)
      image = Image.create(name: "Night Market", url: "http://cdn.theakyra.com/files/2214/5456/0974/Night-Bazaar.jpg")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit destination_images_path(destination)

      within(".image-#{image.id}") do
        find(:xpath, ".//a[i[contains(@class, 'fas fa-plus-circle')]]").click
      end

      expect(current_path).to eq(destinations_path)
      expect(page).to have_content("Added image \"#{image.name}\" to #{destination.title}")
    end
  end
end
