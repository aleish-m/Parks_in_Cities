require 'rails_helper'

RSpec.describe 'parks edit page', type: :feature do

  describe "as a visitor" do

    before :each do

      @city = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

      @park_1 = @city.parks.create!(name: 'Nancy Lewis Park', acres: 9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
      @park_2 = @city.parks.create!(name: 'America the Beautiful Park', acres: 17, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
      @park_3 = @city.parks.create!(name: 'Garden of the Gods', acres: 1341, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

    end

    describe 'when I visit /parks' do

      it 'I see a link to "Update Park Info", when I click the link "Update Park Info" then I am taken to "/parks/:id/edit"' do
        visit "/parks"
        save_and_open_page

        find_link({text:'Update Park Info', :href => "/parks/#{@park_1.id}/edit"}).visible?
        click_link ({text:'Update Park Info', :href => "/parks/#{@park_1.id}/edit"})
        expect(page).to have_current_path("/parks/#{@park_1.id}/edit")
      end

      it 'I see a link to "Update Park Info", next to all records"' do
        visit "/parks"

        find_link({text:'Update Park Info', :href => "/parks/#{@park_2.id}/edit"}).visible?
        click_link ({text:'Update Park Info', :href => "/parks/#{@park_2.id}/edit"})
      end
    end

    describe 'when I visit /cities/:id/parks' do

      it 'I see a link to "Update Park Info", when I click the link "Update Park Info" then I am taken to "/parks/:id/edit"' do
        visit "/cities/#{@city.id}/parks"
        save_and_open_page

        find_link({text:'Update Park Info', :href => "/parks/#{@park_1.id}/edit"}).visible?
        click_link ({text:'Update Park Info', :href => "/parks/#{@park_1.id}/edit"})
        expect(page).to have_current_path("/parks/#{@park_1.id}/edit")
      end

      it 'I see a link to "Update Park Info", next to all records"' do
        visit "/cities/#{@city.id}/parks"

        find_link({text:'Update Park Info', :href => "/parks/#{@park_2.id}/edit"}).visible?
        find_link({text:'Update Park Info', :href => "/parks/#{@park_3.id}/edit"}).visible?
        click_link ({text:'Update Park Info', :href => "/parks/#{@park_2.id}/edit"})
      end
    end

    describe 'when I visit /parks/:id' do

      it 'I see a link to "Update Park Info", when I click the link "Update Park Info" then I am taken to "/parks/:id/edit"' do
        visit "/parks/#{@park_1.id}"
        save_and_open_page

        find_link('Update Park Info').visible?
        click_link 'Update Park Info'
        expect(page).to have_current_path("/parks/#{@park_1.id}/edit")
      end
    end


    describe 'when I visit /parks/:id/edit' do
      it 'I  see a form to edit the city attributes:' do
        visit "/parks/#{@park_1.id}/edit"
        
        expect(page.has_field? "park_name").to be true
        expect(page.has_field? "park_acres").to be true
        expect(page.has_field? "visitor_center_no").to be true
        expect(page.has_field? "opening_hour").to be true
        expect(page.has_field? "closing_hour").to be true
        find_button('Submit').visible?
      end

      it 'When I fill out the form with updated information and I click the button to submit the form, then a `PATCH` request is sent to "/cities/:id", and the Cities info is updated,and I am redirected to the Cities Show page where I see the updated info' do
        visit "/parks/#{@park_1.id}/edit"

        save_and_open_page

        fill_in("park_name", with: "Duck Park")
        choose("visitor_center_no")
        choose("playground_yes")
        fill_in("opening_hour", with: 5)
        fill_in("closing_hour", with: 11)

        click_button('Submit')

        expect(current_path).to eq("/parks/#{@park_1.id}")

        save_and_open_page

        expect(page).to have_content('Duck Park')
        expect(page).to have_content('Acreage: 9')
        expect(page).to have_content('11 PM')
      end
      
      it 'I see a link at the top of the page that takes me to the Park Index' do
        visit "/cities/#{@city.id}/edit"

        find_link('Park Index').visible?
        click_link 'Park Index'
        expect(page).to have_current_path (parks_path)
      end

      it 'I see a link at the top of the page that takes me to the City Index'do
        visit "/cities/#{@city.id}/edit"

        find_link('City Index').visible?
        click_link 'City Index'
        expect(page).to have_current_path(cities_path)
      end
    end
  end
end
