class CreateExcretes < ActiveRecord::Migration[5.2]
  def change
    create_table :excretes do |t|

      t.timestamps
    end
  end
end
