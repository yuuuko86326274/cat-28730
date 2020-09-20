class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :c_name                ,null:false
      t.text :c_text                  ,null:false
      t.integer :price
      t.integer :breed_id
      t.integer :ope_id               ,null:false
      t.integer :sex_id               ,null:false
      t.integer :age_id               ,null:false
      t.integer :hair_length_id
      t.integer :color_id
      t.integer :how_many_id
      t.integer :eye_color_id
      t.integer :character_id         ,null:false
      t.integer :fleas_id             ,null:false
      t.integer :veccine_id           ,null:false
      t.integer :kuchu_id             ,null:false
      t.integer :single_id
      t.integer :senior_id
      t.references :trader            ,null:false, forein_key: true
      t.timestamps
    end
  end
end
