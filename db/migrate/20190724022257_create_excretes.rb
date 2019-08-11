class CreateExcretes < ActiveRecord::Migration[5.2]
  def change
    create_table :excretes do |t|
      t.belongs_to :pet, foreign_key: true
      t.text :note
      t.datetime :datetime

      t.timestamps
    end
  end
end
