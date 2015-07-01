class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :nickname
      t.datetime :birthdate
      t.float :lat
      t.float :lng
      t.boolean :parent
      t.string :image_url
      t.integer :family_id

      t.timestamps null: false
    end
  end
end
