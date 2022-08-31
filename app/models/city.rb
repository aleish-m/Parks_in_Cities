class City < ApplicationRecord
  has_many :parks, dependent: :destroy

  def park_count
    self.parks.count
  end

  def min_acreage(number)
      parks.where("acres > #{number.to_i}")
  end
end