require 'rails_helper'

RSpec.describe "cities show page", type: :feature do

  describe "as a visitor" do

    describe 'when I visit /cities/:id' do
      it 'I see the name of the City with that id' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        visit "/cities/#{city.id}"

        expect(page).to have_content(city.name)
        expect(page).to_not have_content(city_2.name)

      end

      it 'I see the city with that id including the population' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 120, state_capital: false)

        visit "/cities/#{city.id}"

        expect(page).to have_content(city.population)
        expect(page).to_not have_content(city_2.population)

      end
      
      it 'I see the city with that id including if it is the State Capital' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        visit "/cities/#{city.id}"

        expect(page).to have_content("State Capital? Yes")
        expect(page).to_not have_content("State Capital? No")
      end
    end
  end
end