require 'rails_helper'

RSpec.describe 'cities index page', type: :feature do

  describe "as a visitor" do

    describe 'when I visit /cities' do
      before :each do
        @city_1 = City.create!(name: 'Denver', population: 1000, state_capital: true, created_at: '2022-07-01')
        @city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false, created_at: '2022-08-01')
        @city_3 = City.create!(name: 'Fort Collins', population: 80, state_capital: false, created_at: '2022-08-22')
      end

      it 'then I see the name of each parent record in the system' do
        visit '/cities'

        expect(page).to have_content(@city_1.name)
        expect(page).to have_content(@city_2.name)
        expect(page).to have_content(@city_3.name)
      end

      it 'I see that records are ordered by most recently created first' do
        visit '/cities'

        save_and_open_page
        
        expect('Fort Collins').to appear_before('Denver')
        expect('Fort Collins').to appear_before('Colorado Springs')
        expect('Colorado Springs').to appear_before('Denver')

      end

      it 'I see when it was created next to the record' do 
        visit '/cities/'

        expect(page).to have_content('Fort Collins (created: 08/22/2022')
      end

      it 'I see a link at the top of the page that takes me to the Park Index' do
        visit '/cities/'

        find_link('Park Index').visible?
        click_link 'Park Index'
        expect(page).to have_current_path (parks_path)
      end

      it 'I see a link at the top of the page that takes me to the City Index'do
        visit '/cities/'

        find_link('City Index').visible?
        click_link 'City Index'
        expect(page).to have_current_path(cities_path)
      end

    end
  end
end