class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :family_name
      t.string :img_url

      t.timestamps null: false
    end
  end
end
