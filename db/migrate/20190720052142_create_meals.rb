class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.belongs_to :pet, foreign_key: true
      t.string :food
      t.text :quantity
      t.text :note
      t.datetime :datetime

      t.timestamps
    end
  end
end
