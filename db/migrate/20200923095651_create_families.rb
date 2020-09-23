class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.string :donation
      t.references :cat
      t.references :trader
      t.timestamps
    end
  end
end
