class AddCitiesToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :city, foreign_key: true
  end
end
