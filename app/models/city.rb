class City < ApplicationRecord
  has_many :parks, dependent: :destroy

  def park_count
    self.parks.count
  end
end