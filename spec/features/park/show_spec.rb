require 'rails_helper'

RSpec.describe "park show page", type: :feature do
  describe "as a visitor" do

    describe 'when I visit /parks/:id' do

      it 'I see the name of the Park with that id' do
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_3 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_1.id}"

        expect(page).to have_content(park_1.name)
        expect(page).to_not have_content(park_2.name)
      end
      
      it 'I see the park with that id including the number of acres' do 
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)

        visit "/parks/#{park_1.id}"

        expect(page).to have_content(park_1.acres)
        expect(page).to_not have_content(park_2.acres)
      end

      it 'I see the park with that id including if it has a visitor center' do
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_1.id}"

        expect(page).to have_content("Visitor Center: No")
        expect(page).to_not have_content("Visitor Center: Yes")
      end

      it 'I see the park with that id including if it has a visitor center' do
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_2.id}"

        expect(page).to_not have_content("Visitor Center: No")
        expect(page).to have_content("Visitor Center: Yes")
      end

      it 'I see the park with that id including if it has a playground' do 
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_1.id}"

        expect(page).to have_content("Playground: Yes")
        expect(page).to_not have_content("Playground: No")
      end

      it 'I see the park with that id including if it has a playground' do
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_2.id}"
        save_and_open_page

        expect(page).to_not have_content("Playground: Yes")
        expect(page).to have_content("Playground: No")
      end

      it 'I see the park with that id including its opening hour' do
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_1.id}"

        expect(page).to have_content("Park Opens at: #{park_1.opening_hour}")
      end

      it 'I see the park with that id including its closing hour' do
        park_1 = Park.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
        park_2 = Park.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

        visit "/parks/#{park_1.id}"
        save_and_open_page

        expect(page).to have_content("Park Closes at: #{park_1.closing_hour}")
        expect(page).to_not have_content("Park Closes at: #{park_2.closing_hour}")
      end
    end
  end
end