require 'rails_helper'

RSpec.describe "cities index page", type: :feature do
  describe "as a visitor" do
    describe 'when I visit /parents' do
      it 'then I see the name of each parent record in the system' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)
        city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)
        city_2 = City.create!(name: 'Fort Collins', population: 80, state_capital: false)

        visit '/cities'
        save_and_open_page

        require "pry"; binding.pry
        expect(page).to have_content(city.name)
        expect(page).to have_content(city_2.name)
      end
    end
    describe 'when I visit /parents/:id' do
      it 'I see the parent with that id including the parents attributes' do
        city = City.create!(name: 'Denver', population: 1000, state_capital: true)

      end
    end
  end
  # xit 'I see each child in the system' do
  #   city = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

  #   park_1 = Park.create!(name: 'Bonfort Park', acres: )
  # end
  # it "including the child's attributes"
end