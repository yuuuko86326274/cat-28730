class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.string :donation   ,null:false
      t.text   :message    ,null:false
      t.references :cat       ,null:false, forein_key: true
      t.references :trader    ,null:false, forein_key: true
      t.references :personal  ,null:false, forein_key: true
      t.timestamps
    end
  end
end
