class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :acres
      t.boolean :visitor_center
      t.boolean :playground
      t.integer :opening_hour
      t.integer :closing_hour

      t.timestamps
    end
  end
end
