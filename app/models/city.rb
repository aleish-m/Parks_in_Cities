class City < ApplicationRecord
  has_many :parks

  def park_count
    self.parks.count
  end
  
end