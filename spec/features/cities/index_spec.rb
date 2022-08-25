require 'rails_helper'

RSpec.describe "cities index page", type: :feature do
  describe "as a visitor" do
    describe 'when I visit /cities' do
      it 'then I see the name of each parent record in the system' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)
        city_3 = City.create!(name: 'Fort Collins', population: 80, state_capital: false)

        visit '/cities'

        expect(page).to have_content(city.name)
        expect(page).to have_content(city_2.name)
        expect(page).to have_content(city_3.name)
      end
    end
  end
end