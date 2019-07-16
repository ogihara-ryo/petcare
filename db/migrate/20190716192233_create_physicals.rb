class CreatePhysicals < ActiveRecord::Migration[5.2]
  def change
    create_table :physicals do |t|
      t.belongs_to :pet, foreign_key: true
      t.float :height
      t.float :weight
      t.text :note
      t.date :date

      t.timestamps
    end
  end
end
