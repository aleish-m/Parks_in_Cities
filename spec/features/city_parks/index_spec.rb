require 'rails_helper'

RSpec.describe 'City Parks Index page', type: :feature do

  describe 'As a visitor' do

    describe 'I visit /cities/:city_id/parks' do

      before :each do

        @city_1 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)
        @city_2 = City.create!(name: 'Denver', population: 1000, state_capital: true)

        @park_1 = @city_1.parks.create!(name: 'Nancy Lewis Park', acres: 9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_2 = @city_1.parks.create!(name: 'America the Beautiful Park', acres: 17, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_3 = @city_1.parks.create!(name: 'Garden of the Gods', acres: 1341, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)
      end
      
      it 'I see the name of each park record in that city' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content('Colorado Springs')
        expect(page).to_not have_content('Denver')
        
        expect(page).to have_content('Nancy Lewis Park')
        expect(page).to have_content('America the Beautiful Park')
        expect(page).to have_content('Garden of the Gods')
      end

      it 'I see each park size (acres)'do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content('Park Size: 9 acres')
        expect(page).to have_content('Park Size: 17 acres')
        expect(page).to have_content('Park Size: 1341 acres')
      end

      it 'I see if each park has a visitor center' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content('Visitor Center? Yes')
        expect(page).to have_content('Visitor Center? No')
      end

      it 'I see if each park has a playground' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content('Playground? Yes')
        expect(page).to have_content('Playground? No')
      end

      it 'I see when each park opens and closes' do
        visit "/cities/#{@city_1.id}/parks"

        expect(page).to have_content('Park Hours: 5 AM - 10 PM')
        expect(page).to have_content('Park Hours: 5 AM - 9 PM')
      end

      it 'I see a link at the top of the page that takes me to the Park Index' do
        visit "/cities/#{@city_1.id}/parks"

        find_link('Park Index').visible?
        click_link 'Park Index'
        expect(page).to have_current_path (parks_path)
      end

      it 'I see a link at the top of the page that takes me to the City Index' do
        visit "/cities/#{@city_1.id}/parks"

        find_link('City Index').visible?
        click_link 'City Index'
        expect(page).to have_current_path(cities_path)
      end

      it 'I see that park records are in alphabetical order by name' do
        visit "/cities/#{@city_1.id}/parks"
        
        expect('America the Beautiful Park').to appear_before('Garden of the Gods')
        expect('America the Beautiful Park').to appear_before('Nancy Lewis Park')
        expect('Garden of the Gods').to appear_before('Nancy Lewis Park')
      end
    end
  end
end