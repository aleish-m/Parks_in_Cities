require 'rails_helper'

RSpec.describe 'cities delete button', type: :feature do

  describe 'as a visitor' do

    before :each do

      @city = City.create!(name: 'Denver', population: 1000, state_capital: true)
      @city_2= City.create!(name: 'Colorado Springs', population: 190, state_capital: false)

      @park_1 = @city.parks.create!(name: 'City Park', acres: 330, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
      @park_2 = @city_2.parks.create!(name: "Sloan's Lake Park", acres: 177, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
    end

    describe 'When I visit /cities/:id' do

      it 'I see a link to delete the city' do
        visit "/cities/#{@city.id}"
        find_button("Delete #{@city.name}").visible?
      end

      it 'When I click the link "Delete City", a "DELETE" request is sent to "/cities/:id" the city is deleted, and all park records are deleted and I am redirected to the city index page where I no longer see this city' do
        visit "/cities/#{@city.id}"

        click_button("Delete #{@city.name}")

        expect(current_path).to eq("/cities")
        expect(page).to_not have_content('Denver')

        visit '/parks'

        expect(page).to_not have_content('City Park')
        expect(page).to have_content("Sloan's Lake Park")
      end
    end

    describe 'I visit /cities' do

      it 'I see a link to delete the city' do
        visit "/cities"
        find_button("Delete #{@city.name}").visible?
      end

      it 'When I click the link "Delete City", a "DELETE" request is sent to "/cities" the city is deleted, and all park records are deleted and I am redirected to the city index page where I no longer see this city' do
        visit "/cities"

        click_button("Delete #{@city.name}")

        expect(current_path).to eq("/cities")
        expect(page).to_not have_content('Denver')

        visit '/parks'

        expect(page).to_not have_content('City Park')
        expect(page).to have_content("Sloan's Lake Park")
      end
    end
  end 
end

