require 'rails_helper'

RSpec.describe 'Cities New page', type: :feature do

  describe "As a visitor" do

    describe 'I visit /cities' do

      it 'I see a link to create a new City record' do
        visit '/cities/'

        find_link('Add New City').visible?
      end

      it '"Add New City" when I click this link, I am taken to "/cities/new"' do
        visit '/cities/'

        click_link 'Add New City'
        expect(page).to have_current_path(cities_new_path)
      end
    end

    describe 'I visit cities/new' do 

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

      it "I  see a form for a new city record I fill out the form with a new city's attributes: and click the button 'Add City' to submit the form" do
        visit '/cities/new'

        expect(page.has_field? "name").to be true
        expect(page.has_field? "population").to be true
        expect(page.has_field? "state_capital").to be true
        find_button('Add City').visible?
      end

      it "A 'POST' request is sent to the '/cities' route, a new city record is created and I am redirected to the City Index page where I see the new City displayed" do 
        visit '/cities/new'

        fill_in("name", with: "Boulder")
        fill_in("population", with: 3000)
        choose("No")

        click_button('Add City')
        expect(current_path).to eq('/cities')
        expect(page).to have_content('Boulder')
      end
    end
  end
end