require 'rails_helper'

RSpec.describe 'Park Index page', type: :feature do
  
  describe 'As a visitor' do

    describe 'When I visit /parks' do

      before :each do

        @city_1 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

        @park_1 = @city_1.parks.create!(name: 'Nancy Lewis Park', acres: 9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        @park_2 = @city_1.parks.create!(name: 'America the Beautiful Park', acres: 17, visitor_center: true, playground: true, opening_hour: 6, closing_hour: 9)
        @park_3 = @city_1.parks.create!(name: 'Garden of the Gods', acres: 1341, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)
      end

      it 'I see each park name in the system' do 
        visit '/parks'
        expect(page).to have_content('Nancy Lewis Park')
        expect(page).to have_content('America the Beautiful Park')
      end

      it 'I see each parks number of acres' do 
        visit '/parks'
        expect(page).to have_content("Acres: 9")
        expect(page).to have_content("Acres: 17")
      end

      it 'I see if each park has a visitor center' do
        visit '/parks'
        expect(page).to have_content('Has Visitor Center? No')
        expect(page).to have_content('Has Visitor Center? Yes')
      end

      it 'I see if each park has a playground' do
        visit '/parks'
        expect(page).to have_content('Has Playground? Yes')
      end

      it 'I see each parks opening and closing hours' do
        visit '/parks'
        expect(page).to have_content('Park Hours: 5 AM - 10 PM')
        expect(page).to have_content('Park Hours: 6 AM - 9 PM')
      end

      it 'I see a link at the top of the page that takes me to the Park Index' do
        visit '/parks'

        find_link('Park Index').visible?
        click_link 'Park Index'
        expect(page).to have_current_path (parks_path)
      end

      it 'I see a link at the top of the page that takes me to the City Index'do
        visit '/parks'

        find_link('City Index').visible?
        click_link 'City Index'
        expect(page).to have_current_path(cities_path)
      end

      it 'I only see records where the playground column is `true`' do
        visit '/parks'

        expect(page).to have_content(@park_1.name)
        expect(page).to have_content(@park_2.name)
        expect(page).to_not have_content(@park_3.name)        
      end
    end
  end
end