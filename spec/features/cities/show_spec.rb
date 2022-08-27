require 'rails_helper'

RSpec.describe "cities show page", type: :feature do

  describe "as a visitor" do

    describe 'when I visit /cities/:id' do
      before :each do
        @city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        @city_2= City.create!(name: 'Colorado Springs', population: 190, state_capital: false)

        @park_1 = @city.parks.create!(name: 'City Park', acres: 330, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
        @park_2 = @city.parks.create!(name: "Sloan's Lake Park", acres: 177, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
      end

      it 'I see the name of the City with that id' do
        visit "/cities/#{@city.id}"

        expect(page).to have_content(@city.name)
        expect(page).to_not have_content(@city_2.name)

      end

      it 'I see the @city with that id including the population' do
        visit "/cities/#{@city.id}"

        expect(page).to have_content(@city.population)
        expect(page).to_not have_content(@city_2.population)

      end
      
      it 'I see the @city with that id including if it is the State Capital' do
        visit "/cities/#{@city.id}"

        expect(page).to have_content("State Capital? Yes")
        expect(page).to_not have_content("State Capital? No")
      end

      it 'I see a count of the number of parks in this @city' do
        visit "/cities/#{@city.id}"

        save_and_open_page

        expect(page).to have_content("Number of Parks: 2")
      end
    end
  end
end