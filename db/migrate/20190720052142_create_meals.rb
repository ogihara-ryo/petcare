class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :food
      t.text :quantity
      t.text :note
      t.datetime :datetime

      t.timestamps
    end
  end
end
