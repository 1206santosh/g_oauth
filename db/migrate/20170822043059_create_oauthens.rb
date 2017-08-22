class CreateOauthens < ActiveRecord::Migration
  def change
    create_table :oauthens do |t|
      t.string :provider
      t.string :token
      t.string :refresh_token
      t.timestamps null: false
    end
  end
end
