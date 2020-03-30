class CreateNutrients < ActiveRecord::Migration[5.2]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.integer :set_price
      t.integer :alacarte_price

      t.timestamps
    end
  end
end
