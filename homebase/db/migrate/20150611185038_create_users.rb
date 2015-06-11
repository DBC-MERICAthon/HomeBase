class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.datetime :birthdate
      t.string :img_url
      t.boolean :parent
      t.belongs_to :family, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
