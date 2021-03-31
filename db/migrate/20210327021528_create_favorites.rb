class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :personal,  null: false, foreign_key: true
      t.references :cat,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
