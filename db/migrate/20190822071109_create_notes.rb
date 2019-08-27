class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.belongs_to :pet, foreign_key: true
      t.text :body
      t.datetime :datetime

      t.timestamps
    end
  end
end
