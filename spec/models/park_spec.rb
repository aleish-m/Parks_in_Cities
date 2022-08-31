require 'rails_helper'

RSpec.describe Park do
  it {should belong_to :city}
end