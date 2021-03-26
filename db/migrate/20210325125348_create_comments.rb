class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :personal                  , forein_key: true
      t.references :trader                    , forein_key: true
      t.references :cat            ,null:false, forein_key: true
      t.text :comment              ,null:false
      t.timestamps
    end
  end
end
