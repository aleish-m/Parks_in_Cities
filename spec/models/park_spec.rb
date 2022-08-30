require 'rails_helper'

RSpec.describe Park do
  it {should belong_to :city}

  it ".min_acreage(number)" do
    city = City.create!(name: 'Colorado Springs', population: 100, state_capital: false)

    park_1 = city.parks.create!(name: 'Nancy Lewis Park', acres: 9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
    park_2 = city.parks.create!(name: 'America the Beautiful Park', acres: 17, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
    park_3 = city.parks.create!(name: 'Garden of the Gods', acres: 1341, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

    expect(city.parks.min_acreage(20)).to eq([park_3])

    expect(city.parks.min_acreage(10)).to eq([ park_2, park_3])
  end
end