require 'rails_helper'

RSpec.describe City do
  describe 'relationships' do
    it {should have_many :parks}
  end

  describe 'class methods' do 
    it '.park_count' do
      city = City.create!(name: 'Denver', population: 1000, state_capital: true)
      park_1 = city.parks.create!(name: 'City Park', acres: 330, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
      park_2 = city.parks.create!(name: "Sloan's Lake Park", acres: 177, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)

      expect(city.park_count).to eq(2)
    end
  end

end