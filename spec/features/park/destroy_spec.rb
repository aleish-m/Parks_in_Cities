require 'rails_helper'

RSpec.describe 'Park Delete button', type: :feature do

  describe 'As a visitor' do

    before :each do

      @city = City.create!(name: 'Denver', population: 1000, state_capital: true)
      @city_2= City.create!(name: 'Colorado Springs', population: 190, state_capital: false)

      @park_1 = @city.parks.create!(name: 'City Park', acres: 330, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
      @park_2 = @city.parks.create!(name: "Sloan's Lake Park", acres: 177, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
    end

    describe 'I visit /parks/:id' do

      it 'I see a link to delete the park' do
        visit "/parks/#{@park_1.id}"
        find_button('Delete City Park').visible?
      end

      it 'When I click the link "Delete Park", a "DELETE" request is sent to "/parks/:id" the park is deleted, I am redirected to the park index page where I no longer see this park' do
        visit "/parks/#{@park_1.id}"

        click_button('Delete City Park')

        expect(current_path).to eq("/parks")
        expect(page).to_not have_content('City Park')
        expect(page).to have_content("Sloan's Lake Park")
      end
    end

    describe 'when I visit /parks' do

      it 'I see a link to delete the park' do
        visit "/parks"
        find_button('Delete City Park').visible?
      end

      it 'When I click the link "Delete Park", a "DELETE" request is sent to "/parks/:id" the park is deleted, I am redirected to the park index page where I no longer see this park' do
        visit "/parks"

        click_button('Delete City Park')

        expect(current_path).to eq("/parks")
        expect(page).to_not have_content('City Park')
        expect(page).to have_content("Sloan's Lake Park")
      end
    end

    describe 'when I visit cities/:city_id/parks' do

      it 'I see a link to delete the park' do
        visit "/cities/#{@city.id}/parks"
        find_button('Delete City Park').visible?
      end

      it 'When I click the link "Delete Park", a "DELETE" request is sent to "/parks/:id" the park is deleted, I am redirected to the park index page where I no longer see this park' do
        visit "/cities/#{@city.id}/parks"

        click_button('Delete City Park')

        expect(current_path).to eq("/parks")
        expect(page).to_not have_content('City Park')
        expect(page).to have_content("Sloan's Lake Park")
      end
    end
  end 
end