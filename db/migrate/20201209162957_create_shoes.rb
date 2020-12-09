class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :name
      t.string :colorway
      t.decimal :price

      t.timestamps
    end
  end
end
