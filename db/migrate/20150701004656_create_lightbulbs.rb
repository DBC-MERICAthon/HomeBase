class CreateLightbulbs < ActiveRecord::Migration
  def change
    create_table :lightbulbs do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :ip_address
      t.string :bulb_name
      t.integer :bulb_number

      t.timestamps null: false
    end
  end
end
