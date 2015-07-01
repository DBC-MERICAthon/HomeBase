class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :home_address
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
