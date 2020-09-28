class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_name          ,null:false
      t.string :last_name           ,null:false
      t.string :first_pkey          ,null:false
      t.string :last_pkey           ,null:false
      t.date :birthday              ,null:false
      t.string  :postal_code        ,null:false
      t.integer :area_id            ,null:false
      t.string :city                ,null:false
      t.string :address_num         ,null:false
      t.string :building_num
      t.string :tel                 ,null:false
      t.references :family          ,null:false   , forein_key: true
      t.timestamps
    end
  end
end
