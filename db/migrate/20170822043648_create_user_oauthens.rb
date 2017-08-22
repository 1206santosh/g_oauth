class CreateUserOauthens < ActiveRecord::Migration
  def change
    create_table :user_oauthens do |t|
      t.integer :user_id
      t.integer :oauthen_id
      t.timestamps null: false
    end
  end
end
