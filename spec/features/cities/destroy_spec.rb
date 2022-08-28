require 'rails_helper'

RSpec.describe 'cities show page', type: :feature do

  describe 'as a visitor' do
    before :each do
      @city = City.create!(name: 'Denver', population: 1000, state_capital: true)
      @city_2= City.create!(name: 'Colorado Springs', population: 190, state_capital: false)

      @park_1 = @city.parks.create!(name: 'City Park', acres: 330, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
      @park_2 = @city.parks.create!(name: "Sloan's Lake Park", acres: 177, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
    end

    describe 'when I visit /cities/:id' do
      it 'I see a link to delete the city' do
        visit "/cities/#{@city.id}"

        save_and_open_page

        find_button("Delete #{@city.name}").visible?
      end

      it 'When I click the link "Delete City", a "DELETE" request is sent to "/parents/:id" the parent is deleted, and all child records are deleted and I am redirected to the parent index page where I no longer see this parent' do
        visit "/cities/#{@city.id}"

        click_button("Delete #{@city.name}")
      end
    end
  end 
end

