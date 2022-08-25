require 'rails_helper'

RSpec.describe "cities index page", type: :feature do
  describe "as a visitor" do
    describe 'when I visit /cities' do
      it 'then I see the name of each parent record in the system' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)
        city_3 = City.create!(name: 'Fort Collins', population: 80, state_capital: false)

        visit '/cities'
        # save_and_open_page

        expect(page).to have_content(city.name)
        expect(page).to have_content(city_2.name)
      end
    end
    describe 'when I visit /cities/:id' do
      it 'I see the name of the City with that id' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        visit "/cities/#{city.id}"
        # save_and_open_page

        expect(page).to have_content(city.name)
        expect(page).to_not have_content(city_2.name)

      end

      it 'I see the parent with that id including the population' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 120, state_capital: false)

        visit "/cities/#{city.id}"
        # save_and_open_page

        expect(page).to have_content(city.population)
        expect(page).to_not have_content(city_2.population)

      end
      it 'I see the parent with that id including if it is the State Capital' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        visit "/cities/#{city.id}"
        # save_and_open_page

        expect(page).to have_content("State Capital? Yes")
        expect(page).to_not have_content("State Capital? No")

      end
    end

    describe 'when I visit /parks' do
      
    end
  end
  # xit 'I see each child in the system' do
  #   city = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

  #   park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9)
  # end
  # it "including the child's attributes"
end