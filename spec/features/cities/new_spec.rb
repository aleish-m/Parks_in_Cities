require 'rails_helper'

RSpec.describe 'cities index page', type: :feature do

  describe "as a visitor" do

    describe 'when I visit /cities' do

      it 'I see a link to create a new City record, "Add New City" when I click this link, I am taken to "/cities/new"' do
        visit '/cities/'

        find_link('Add New City').visible?
        click_link 'Add New City'
        expect(page).to have_current_path(cities_new_path)
      end
      
    end

    describe 'when I visit cities/new' do 

      it 'I see a link at the top of the page that takes me to the Park Index' do
        visit '/cities/new'

        find_link('Park Index').visible?
        click_link 'Park Index'
        expect(page).to have_current_path (parks_path)
      end

      it 'I see a link at the top of the page that takes me to the City Index'do
        visit '/cities/new'

        find_link('City Index').visible?
        click_link 'City Index'
        expect(page).to have_current_path(cities_path)
      end

      it "Where I  see a form for a new city record I fill out the form with a new city's attributes: and click the button 'Create City' to submit the form" do
        visit '/cities/new'

        save_and_open_page

        fill_in("city_name", with: "Boulder")
        fill_in("city_population", with: 3000)
        choose("No")

        click_button('Add City')
      end

      it "A 'POST' request is sent to the '/cities' route, a new city record is created and I am redirected to the City Index page where I see the new City displayed" do 
        visit '/cities/new'

        fill_in("city_name", with: "Boulder")
        fill_in("city_population", with: 3000)
        choose("No")

        click_button('Add City')
        expect(current_path).to eq('/cities')

        save_and_open_page

        expect(page).to have_content('Boulder')
      end
    end
  end
end