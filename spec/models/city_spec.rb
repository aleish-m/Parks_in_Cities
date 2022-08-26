require 'rails_helper'

RSpec.describe City do
  it {should have_many :parks}
end