require 'rails_helper'

RSpec.describe "park index page", type: :feature do
  describe "as a visitor" do

    describe 'when I visit /parks' do

      it 'I see each Park name in the system' do 
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_3 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit '/parks'
        save_and_open_page

        expect(page).to have_content(park_1.name)
        expect(page).to have_content(park_2.name)
        expect(page).to have_content(park_3.name)
      end
      
    end
  end
end