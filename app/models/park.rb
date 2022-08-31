class Park < ApplicationRecord
  belongs_to :city

  def self.min_acreage(number)
    require "pry"; binding.pry
      where("acres > #{number.to_i}")
  end
end