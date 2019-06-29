class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.string :uid
      t.datetime :last_logged_in_at

      t.timestamps
    end
  end
end
