class AddCitiesToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :cities, foreign_key: true
  end
end
