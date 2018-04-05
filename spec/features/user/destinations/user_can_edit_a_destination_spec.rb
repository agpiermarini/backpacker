require 'rails_helper'

describe 'User' do
  describe 'completes a form to edit a destination' do
    it 'and the destination is updated' do
      user = User.create(username: "username", password: "password", email: "email@email.com")
      country = Country.create(name: "Thailand")
      destination = user.destinations.create(title: "Angkor Tempel Complex", notes: "Watch the sunrise at Angkor Wat", country_id: country.id)
      new_title = "Angkor Temple Complex"
      new_notes = "Watch the sunrise at Angkor Wat. See the faces of Angkor Thom."
      new_country = Country.create(name: "Cambodia")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit destination_path(destination)

      find(:xpath, ".//a[i[contains(@class, 'fas fa-edit')]]").click


      fill_in 'destination[title]', with: new_title
      select "#{new_country.name}", from: 'destination[country_id]'
      fill_in 'destination[notes]', with: new_notes
      click_on 'Update Destination'

      expect(current_path).to eq(destinations_path)

      within(".destination-#{destination.id}") do
        expect(page).to have_content(new_title)
        expect(page).to have_content(new_country.name)
      end
    end
  end
end
