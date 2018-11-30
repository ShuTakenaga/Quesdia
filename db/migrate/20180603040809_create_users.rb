class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :username
      t.string :password_digest
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
