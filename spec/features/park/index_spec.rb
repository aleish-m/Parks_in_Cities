require 'rails_helper'

RSpec.describe "park index page", type: :feature do
  describe "as a visitor" do
    describe 'when I visit /parks' do
      before :each do
        @city_1 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        @park_1 = @city_1.parks.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_2 = @city_1.parks.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_3 = @city_1.parks.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)
      end

      it 'I see each Park name in the system' do 
        visit '/parks'

        expect(page).to have_content(@park_1.name)
        expect(page).to have_content(@park_2.name)
        expect(page).to have_content(@park_3.name)
      end

      it 'I see the park with that id including the number of acres' do 
        visit "/parks"

        expect(page).to have_content(@park_1.acres)
        expect(page).to have_content(@park_2.acres)
        expect(page).to have_content(@park_3.acres)
      end

      it 'I see the park with that id including if it has a visitor center' do
        visit "/parks"

        expect(page).to have_content("Has Visitor Center? false")
        expect(page).to have_content("Has Visitor Center? true")
      end

      it 'I see the park with that id including if it has a visitor center' do
        visit "/parks"

        expect(page).to have_content("Has Playground? true")
        expect(page).to have_content("Has Playground? false")
      end

      it 'I see the park with that id including its opening and closing hours' do
        visit "/parks"
        save_and_open_page

        expect(page).to have_content("Park Hours: 5 AM - 10 PM")
        expect(page).to have_content("Park Hours: 5 AM - 9 PM")
      end
    end
  end
end