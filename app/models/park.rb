class Park < ApplicationRecord
  belongs_to :city

  def self.min_acreage(number)
      self.where("acres > #{number.to_i}")
  end
end