class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :race
      t.integer :sex, default: 0, null: false
      t.date :birthday
      t.date :greeted_on
      t.text :note
      t.string :thumbnail
      t.string :color

      t.timestamps
    end
  end
end
