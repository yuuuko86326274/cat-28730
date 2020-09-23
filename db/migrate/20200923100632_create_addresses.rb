class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_pkey
      t.string :last_pkey
      t.date :birthday
      t.string  :postal_code
      t.integer :area_id
      t.string :city
      t.string :address_num
      t.string :building_num
      t.string :tel
      t.references :family
      t.timestamps
    end
  end
end
