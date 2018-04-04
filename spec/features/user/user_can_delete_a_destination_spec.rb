require 'rails_helper'

describe 'User' do
  describe 'clicks button to delete destination on destination show page' do
    it 'and the destination is deleted' do
      user = User.create(username: "username", password: "password", email: "email@email.com")
      country = Country.create(name: "South Africa")
      destination = user.destinations.create(title: "Kruger National Park", notes: "Two-day tour of the national park with a night safari", country_id: country.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit destination_path(destination)

      find(:xpath, ".//a[i[contains(@class, 'fas fa-trash-alt')]]").click

      expect(current_path).to eq(destinations_path)

      expect(page).to have_content("Removed #{destination.title} from my destinations")
    end
  end
end
