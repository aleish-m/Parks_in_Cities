require 'rails_helper'

RSpec.describe "cities index page", type: :feature do

  describe "as a visitor" do

    describe 'when I visit /cities' do
      before :each do
        @city_1 = City.create!(name: 'Denver', population: 1000, state_capital: true)
        @city_2 = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)
        @city_3 = City.create!(name: 'Fort Collins', population: 80, state_capital: false)
      end

      it 'then I see the name of each parent record in the system' do
        visit '/cities'

        expect(page).to have_content(@city_1.name)
        expect(page).to have_content(@city_2.name)
        expect(page).to have_content(@city_3.name)
      end

      it 'I see that records are ordered by most recently created first' do
        visit '/cities'
        
        expect('Fort Collins').to appear_before('Denver')
        expect('Fort Collins').to appear_before('Colorado Springs')
        expect('Colorado Springs').to appear_before('Denver')

      end

      it 'I see when it was created next to the record'
    end
  end
end