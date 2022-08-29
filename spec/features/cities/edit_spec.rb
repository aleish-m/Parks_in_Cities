require 'rails_helper'

RSpec.describe 'Cities Edit page', type: :feature do

  describe "As a visitor" do

    before :each do
      
      @city = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)
      
      @park_1 = @city.parks.create!(name: 'Nancy Lewis Park', acres: 8.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
      @park_2 = @city.parks.create!(name: 'America the Beautiful Park', acres: 16.9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
      @park_3 = @city.parks.create!(name: 'Garden of the Gods', acres: 1341.3, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)
    end
  
  
    describe 'When I visit /cities' do
      
      it 'Next to every city, I see a link to edit that citys info' do
        visit '/cities'
        find_link('Update City Info').visible?
      end
    
    
      it  'When I click the link I should be taken to that city edit page where I can update its information'do
        visit '/cities'
        click_link 'Update City Info'
        expect(page).to have_current_path("/cities/#{@city.id}/edit")
      end
    end

    describe 'When I visit /cities/:id' do

      it 'I see a link to "Update City"' do
        visit "/cities/#{@city.id}"
        find_link("Update #{@city.name}'s Info").visible?
      end
    
      it 'When I click the link "Update City" then I am taken to "/cities/:id/edit"' do
        visit "/cities/#{@city.id}"
        click_link "Update #{@city.name}'s Info"
        expect(page).to have_current_path("/cities/#{@city.id}/edit")
      end
    end
    
    describe 'When I visit /cities/:id/edit' do

      it 'When I am on "/cities/:id/edit" I  see a form to edit the city attributes:' do
        visit "/cities/#{@city.id}/edit"

        expect(page.has_field? "name").to be true
        expect(page.has_field? "population").to be true
        expect(page.has_field? "state_capital").to be true
        find_button('Submit').visible?
      end

      it 'When I fill out the form with updated information and I click the button to submit the form, then a `PATCH` request is sent to "/cities/:id", and the Cities info is updated,and I am redirected to the Cities Show page where I see the updated info' do
        visit "/cities/#{@city.id}/edit"

        fill_in("name", with: "C Springs")
        fill_in("population", with: 30000)
        choose("No")
        click_button('Submit')

        expect(current_path).to eq("/cities/#{@city.id}")
        expect(page).to have_content('C Springs')
        expect(page).to have_content('30000')
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
