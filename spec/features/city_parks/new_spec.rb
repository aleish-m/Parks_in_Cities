require 'rails_helper'

RSpec.describe 'city/parks new page', type: :feature do

  describe "as a visitor" do

    before :each do
      @city_1 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

      @park_1 = @city_1.parks.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
      @park_2 = @city_1.parks.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
      @park_3 = @city_1.parks.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

    end

    describe 'when I visit /cities/:city_id/parks' do
      
      it 'I see a link to create add new Park record, "Add New Park" when I click this link, I am taken to "/cities/:city_id/parks/new"' do
        visit "/cities/#{@city_1.id}/parks"
        save_and_open_page

        find_link('Add New Park').visible?
        click_link 'Add New Park'
        expect(page).to have_current_path("/cities/#{@city_1.id}/parks/new")
        save_and_open_page
      end
      
    end

    describe 'when I visit cities/:id/parks/new' do 

      it 'I see a link at the top of the page that takes me to the Park Index' do
        visit "cities/#{@city_1.id}/parks/new"

        find_link('Park Index').visible?
        click_link 'Park Index'
        expect(page).to have_current_path (parks_path)
      end

      it 'I see a link at the top of the page that takes me to the City Index'do
        visit "cities/#{@city_1.id}/parks/new"

        find_link('City Index').visible?
        click_link 'City Index'
        expect(page).to have_current_path(cities_path)
      end

      it "Where I  see a form for a new city record I fill out the form with a new city's attributes: and click the button 'Create City' to submit the form" do
        visit "cities/#{@city_1.id}/parks/new"

        save_and_open_page

        expect(page.has_field? "park_name").to be true
        expect(page.has_field? "park_acres").to be true
        expect(page.has_field? "visitor_center_no").to be true
        expect(page.has_field? "opening_hour").to be true
        expect(page.has_field? "closing_hour").to be true
        find_button('Add Park').visible?
      end

      it "A 'POST' request is sent to the '/cities/:id/parks' route, a new park record is created and I am redirected to the City Parks Index page where I see the new Park listed" do 
        visit "cities/#{@city_1.id}/parks/new"

        fill_in("park_name", with: "Palmer Park")
        fill_in("park_acres", with: 730)
        choose("visitor_center_no")
        choose("playground_yes")
        fill_in("opening_hour", with: 5)
        fill_in("closing_hour", with: 9)

        click_button('Add Park')
        expect(current_path).to eq("/cities/#{@city_1.id}/parks")

        save_and_open_page

        expect(page).to have_content('Palmer Park')
      end
    end
  end
end