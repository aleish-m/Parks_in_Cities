require 'rails_helper'

RSpec.describe "city parks index page", type: :feature do

  describe "as a visitor" do

    describe 'when I visit /cities/:city_id/parks' do
      before :each do
        
        @city_1 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        @park_1 = @city_1.parks.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_2 = @city_1.parks.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_3 = @city_1.parks.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

      end
      it 'then I see the name of each park record in that city' do
        visit "/cities/#{@city_1.id}/parks"
        save_and_open_page

        expect(page).to have_content(@city_1.name)
        expect(page).to have_content(@park_1.name)
        expect(page).to have_content(@park_2.name)
        expect(page).to have_content(@park_3.name)
      end

      it 'I see each park size (acres)'do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content("Park Size: #{@park_1.acres} acres")
        expect(page).to have_content("Park Size: #{@park_2.acres} acres")
        expect(page).to have_content("Park Size: #{@park_3.acres} acres")
      end

      it 'I see if each park has a visitor center' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content("Visitor Center? Yes")
        expect(page).to have_content("Visitor Center? No")
      end

      it 'I see if each park has a playground' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content("Playground? Yes")
        expect(page).to have_content("Playground? No")
      end

      it 'I see when each park opens and closes' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content("Park Hours: 5 AM - 10 PM")
        expect(page).to have_content("Park Hours: 5 AM - 9 PM")
      end
    end
  end
end